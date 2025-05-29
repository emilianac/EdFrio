from datetime import datetime
from io import BytesIO
from flask import Flask, render_template, request, send_file
from docx import Document
import os
import smtplib
from email.message import EmailMessage
from num2words import num2words

app = Flask(__name__)

# Constant for fallback messages
VALOR_INVALIDO_MSG = "Valor inválido"

CAMINHO_MODELO = os.path.join(os.path.dirname(__file__), 'CONTRATO DE LOCAÇÃO.docx')

def numero_por_extenso(n):
    if n < 0 or n > 999:
        return "Número fora do intervalo suportado"
    
    unidades = ["zero", "um", "dois", "três", "quatro", "cinco", "seis", "sete", "oito", "nove"]
    especiais = ["dez", "onze", "doze", "treze", "quatorze", "quinze", "dezesseis", "dezessete", "dezoito", "dezenove"]
    dezenas = ["", "", "vinte", "trinta", "quarenta", "cinquenta", "sessenta", "setenta", "oitenta", "noventa"]
    centenas = ["", "cem", "duzentos", "trezentos", "quatrocentos", "quinhentos", "seiscentos", "setecentos", "oitocentos", "novecentos"]
    
    if n == 0:
        return unidades[0]
    
    texto = ""
    c = n // 100
    d = (n % 100) // 10
    u = n % 10
    
    # Centenas
    if c > 0:
        if n % 100 == 0 and c == 1:
            return "cem"
        else:
            texto += centenas[c]
    
    # Dezenas e unidades
    resto = n % 100
    if resto > 0:
        if texto != "":
            texto += " e "
        if resto < 10:
            texto += unidades[resto]
        elif 10 <= resto < 20:
            texto += especiais[resto - 10]
        else:
            texto += dezenas[d]
            if u > 0:
                texto += " e " + unidades[u]
    
    return texto

def ordinal_por_extenso(n):
    ordinais_ate_20 = [
        "primeiro", "segundo", "terceiro", "quarto", "quinto",
        "sexto", "sétimo", "oitavo", "nono", "décimo",
        "décimo primeiro", "décimo segundo", "décimo terceiro",
        "décimo quarto", "décimo quinto", "décimo sexto",
        "décimo sétimo", "décimo oitavo", "décimo nono", "vigésimo"
    ]
    ordinais_dezenas = {
        20: "vigésimo",
        30: "trigésimo",
    }
    
    if n < 1 or n > 31:
        return "Número fora do intervalo suportado"
    elif n <= 20:
        return ordinais_ate_20[n-1]
    elif 21 <= n <= 29:
        return "vigésimo " + ordinal_por_extenso(n - 20)
    elif n == 30:
        return "trigésimo"
    elif n == 31:
        return "trigésimo primeiro"

# Dicionários para formatação de datas
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

# Função para formatar o dia de pagamento
def formatar_dia_pagamento(dia_pag):
    if dia_pag.isdigit():
        return num2words(int(dia_pag), to='ordinal', lang='pt')
    return dia_pag

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

         # Formatação de datas
        data_inicio = request.form.get("data_inicio", "").strip()
        if "-" in data_inicio or "/" in data_inicio:
            data_inicio = formatar_data(data_inicio)
        else:
            data_inicio = "Formato inválido"

        data_fim = request.form.get("data_fim", "").strip()
        if "-" in data_fim or "/" in data_fim:
            data_fim = formatar_data(data_fim)
        else:
            data_fim = "Formato inválido"
        
        # Cache the formatted current date
        data_atual_formatada = formatar_data(datetime.now().strftime("%d/%m/%Y"))

        def obter_dados_formulario():
            prazo = request.form.get("prazo_meses", "")
            dia_pag = request.form.get("dia_pag", "")
            valor = request.form.get("valor", "")

            return {
                "<<NOME>>": request.form.get("nome_completo", ""),
                "<<CPF>>": cpf_formatado,
                "<<RG>>": rg_formatado,
                "<<ORGAO EMISSOR>>": request.form.get("orgao_emissor", ""),
                "<<ESTADO EMISSOR>>": request.form.get("estado_emissor", ""),
                "<<CIDADE>>": request.form.get("cidade", ""),
                "<<ESTADO>>": request.form.get("estado", ""),
                "<<LOGRADOURO>>": request.form.get("logradouro", ""),
                "<<BAIRRO>>": request.form.get("bairro", ""),
                "<<CEP>>": request.form.get("cep", ""),
                "<<OBJETO>>": request.form.get("objeto", ""),
                "<<MARCA>>": request.form.get("marca", ""),
                "<<MODELO>>": request.form.get("modelo", ""),
                "<<PRAZO>>": prazo,
                "<<PRAZO_EXTENSO>>": numero_por_extenso(int(prazo)) if prazo.isdigit() else VALOR_INVALIDO_MSG,
                "<<DIA PAG>>": request.form.get("dia_pag", ""),
                "<<DIA PAG_ORD>>": formatar_dia_pagamento(dia_pag),
                "<<INICIO>>": data_inicio,
                "<<FIM>>": data_fim,
                "<<VALOR>>": valor,
                "<<VALOR_EXTENSO>>": numero_por_extenso(int(valor)) if valor.isdigit() else VALOR_INVALIDO_MSG,
                "<<DATA>>": data_atual_formatada,
            }
        if not os.path.isfile(CAMINHO_MODELO):
            return "Modelo de contrato não encontrado.", 500

        doc = Document(CAMINHO_MODELO)

        # Obtenha os dados do formulário
        dados = obter_dados_formulario()

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

        # Retorna para download no Flask
        return send_file(
            file_stream,
            as_attachment=True,
            download_name=nome_arquivo,
            mimetype='application/vnd.openxmlformats-officedocument.wordprocessingml.document'
        )

    return render_template('form.html')

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(host="0.0.0.0", port=port)
