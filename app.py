from datetime import datetime
from io import BytesIO
from flask import Flask, render_template, request, send_file
from docx import Document
import os
import smtplib
from email.message import EmailMessage
from num2words import num2words

app = Flask(__name__)

CAMINHO_MODELO = os.path.join(os.path.dirname(__file__), 'CONTRATO DE LOCAÇÃO DE RESFRIADOR.docx')

# Dicionários para formatação de datas
ordinais_ate_31 = {
    1: "primeiro", 2: "segundo", 3: "terceiro", 4: "quarto", 5: "quinto", 6: "sexto", 7: "sétimo",
    8: "oitavo", 9: "nono", 10: "décimo", 11: "décimo primeiro", 12: "décimo segundo",
    13: "décimo terceiro", 14: "décimo quarto", 15: "décimo quinto", 16: "décimo sexto",
    17: "décimo sétimo", 18: "décimo oitavo", 19: "décimo nono", 20: "vigésimo",
    21: "vigésimo primeiro", 22: "vigésimo segundo", 23: "vigésimo terceiro",
    24: "vigésimo quarto", 25: "vigésimo quinto", 26: "vigésimo sexto", 27: "vigésimo sétimo",
    28: "vigésimo oitavo", 29: "vigésimo nono", 30: "trigésimo", 31: "trigésimo primeiro"
}

meses = {
    1: "janeiro", 2: "fevereiro", 3: "março", 4: "abril", 5: "maio", 6: "junho",
    7: "julho", 8: "agosto", 9: "setembro", 10: "outubro", 11: "novembro", 12: "dezembro"
}

# Função de formatação de datas
def formatar_data(data_str):
    if data_str:
        try:
            if "-" in data_str:  # Formato aaaa-mm-dd
                ano, mes, dia = map(int, data_str.split('-'))
            elif "/" in data_str:  # Formato dd/mm/aaaa
                dia, mes, ano = map(int, data_str.split('/'))
            else:
                return data_str  # formato inesperado

            return f"{dia} de {meses[mes]} de {ano}"

        except (ValueError, KeyError):
            return data_str
    return ""

# Página principal
@app.route('/', methods=['GET', 'POST'])
def form():
    if request.method == 'POST':
        # Processamento dos dados do formulário
        # Formatação CPF e RG
        cpf = request.form.get("cpf", "").zfill(11)
        cpf_formatado = f"{cpf[:3]}.{cpf[3:6]}.{cpf[6:9]}-{cpf[9:]}" if len(cpf) == 11 else cpf
        rg = request.form.get("rg", "").zfill(9)
        rg_formatado = f"{rg[:2]}.{rg[2:5]}.{rg[5:8]}-{rg[8]}" if len(rg) == 9 else rg

        # Formatação do dia de pagamento
        dia_pag = request.form.get("dia_pag", "").strip()
        if dia_pag.isdigit():
            dia_pag_int = int(dia_pag)
            if 1 <= dia_pag_int <= 31:
                dia_pag_ord = ordinais_ate_31.get(dia_pag_int, "")
            else:
                dia_pag_ord = ""
        else:
            dia_pag_ord = ""

        # Formatação de datas
        data_inicio = request.form.get("data_inicio", "")
        data_fim = request.form.get("data_fim", "")

        # Formatação do prazo e valor
        prazo = request.form.get("prazo_meses", "")
        if prazo.isdigit():
            prazo_extenso = num2words(prazo, lang='pt')
        else:
            prazo_extenso = prazo
        valor = request.form.get("valor", "")
        if valor.isdigit():
            valor_extenso = num2words(valor, lang='pt')
        else:
            valor_extenso = valor

        # inicializa o dicionário de dados
        dados = {
            "<<NOME>>": request.form.get("nome_completo", ""),
            "<<CPF>>": cpf_formatado,
            "<<RG>>": rg_formatado,
            "<<ORGAO EMISSOR>>": request.form.get("orgao_emissor", ""),
            "<<ESTADO EMISSOR>>": request.form.get("estado_emissor", ""),
            "<<CIDADE>>": request.form.get("cidade", ""),
            "<<ESTADO>>": request.form.get("estado", ""),
            "<<LOGRADOURO>>": request.form.get("logradouro", ""),
            "<<RUA>>": request.form.get("rua", ""),
            "<<BAIRRO>>": request.form.get("bairro", ""),
            "<<CEP>>": request.form.get("cep", ""),
            "<<OBJETO>>": request.form.get("objeto", ""),
            "<<MARCA>>": request.form.get("marca", ""),
            "<<MODELO>>": request.form.get("modelo", ""),
            "<<PRAZO>>": prazo,
            "<<PRAZO_EXTENSO>>": prazo_extenso,
            "<<INICIO>>": formatar_data(data_inicio),
            "<<FIM>>": formatar_data(data_fim),
            "<<DIA PAG>>": dia_pag,
            "<<DIA_PAG_ORD>>": dia_pag_ord,
            "<<VALOR>>": request.form.get("valor", ""),
            "<<VALOR_EXTENSO>>": valor_extenso,
            "<<DATA>>": formatar_data(datetime.now().strftime("%d/%m/%Y")),
        }

        if not os.path.isfile(CAMINHO_MODELO):
            return "Modelo de contrato não encontrado.", 500

        doc = Document(CAMINHO_MODELO)

        # Função de substituição
        def substituir_texto(paragrafos):
            for p in paragrafos:
                for run in p.runs:
                    for chave, valor in dados.items():
                        if chave in run.text:
                            run.text = run.text.replace(chave, valor)

        # Substitui nos parágrafos
        substituir_texto(doc.paragraphs)

        # Substitui nas tabelas
        for tabela in doc.tables:
            for linha in tabela.rows:
                for celula in linha.cells:
                    substituir_texto(celula.paragraphs)

        # Define o nome do arquivo para download
        nome_pessoa = request.form.get("nome_completo", "documento").strip().replace(" ", "_")
        nome_arquivo = f"{nome_pessoa}_Contrato.docx"

        # Salva no stream
        file_stream = BytesIO()
        doc.save(file_stream)
        file_stream.seek(0)
        arquivo_bytes = file_stream.read()

        # Faz o download automático
        return send_file(
            BytesIO(arquivo_bytes),
            as_attachment=True,
            download_name=nome_arquivo,
            mimetype='application/vnd.openxmlformats-officedocument.wordprocessingml.document'
        )

    return render_template('form.html')

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(host="0.0.0.0", port=port)
