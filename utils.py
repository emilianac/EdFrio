# Função para converter números para texto por extenso
from num2words import num2words
from docx import Document
from flask import request

def numero_por_extenso(n):
    if not isinstance(n, int):
        return "Valor inválido"
    if n < 0 or n > 9999:
        return "Número fora do intervalo suportado (0-9999)"
    
    unidades = ["zero", "um", "dois", "três", "quatro", "cinco", "seis", "sete", "oito", "nove"]
    especiais = ["dez", "onze", "doze", "treze", "quatorze", "quinze", "dezesseis", "dezessete", "dezoito", "dezenove"]
    dezenas = ["", "", "vinte", "trinta", "quarenta", "cinquenta", "sessenta", "setenta", "oitenta", "noventa"]
    centenas = ["", "cento", "duzentos", "trezentos", "quatrocentos", "quinhentos", "seiscentos", "setecentos", "oitocentos", "novecentos"]

    texto = ""

    m = n // 1000
    c = (n % 1000) // 100
    d = (n % 100) // 10
    u = n % 10

    # Milhares
    if m > 0:
        if m == 1:
            texto += "mil"
        else:
            texto += unidades[m] + " mil"

    # Centenas
    if c > 0:
        if texto:
            texto += " "
        if c == 1 and d == 0 and u == 0:
            texto += "cem"
        else:
            texto += centenas[c]

    # Dezenas e unidades
    resto = n % 100
    if resto > 0:
        if texto and (c != 0 or m != 0):
            texto += " e "
        if resto < 10:
            texto += unidades[resto]
        elif 10 <= resto < 20:
            texto += especiais[resto - 10]
        else:
            texto += dezenas[d]
            if u > 0:
                texto += " e " + unidades[u]
    elif n == 0:
        texto = unidades[0]

    return texto

# Função para converter números ordinais por extenso
def ordinal_por_extenso(n):
    ordinais_ate_20 = [
        "primeiro", "segundo", "terceiro", "quarto", "quinto",
        "sexto", "sétimo", "oitavo", "nono", "décimo",
        "décimo primeiro", "décimo segundo", "décimo terceiro",
        "décimo quarto", "décimo quinto", "décimo sexto",
        "décimo sétimo", "décimo oitavo", "décimo nono", "vigésimo"
    ]
    
    if not isinstance(n, int) or n < 1 or n > 31:
        return "Número fora do intervalo suportado"
    elif n <= 20:
        return ordinais_ate_20[n-1]
    elif 21 <= n <= 29:
        return "vigésimo " + ordinais_ate_20[n - 21]
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
            if "-" in data_str:  # Formato yyyy-mm-dd
                ano, mes, dia = map(int, data_str.split('-'))
            elif "/" in data_str:  # Formato dd/mm/yyyy
                dia, mes, ano = map(int, data_str.split('/'))
            else:
                return data_str  # formato inesperado

            return f"{dia} de {meses[mes]} de {ano}"

        except (ValueError, KeyError):
            return data_str
    return ""

# Função para formatar o dia de pagamento
def formatar_dia_pagamento(dia_pag):
    if dia_pag is not None and dia_pag.isdigit():
        try:
            return num2words(int(dia_pag), to='ordinal', lang='pt')
        except NotImplementedError:
            return "Conversão ordinal não suportada para o idioma especificado"
    return dia_pag

# Função para substituir dados em um documento do Word
def substituir_dados_doc(doc, dados):
    def substituir_texto(elementos):
        for e in elementos:
            for run in e.runs:
                for chave, valor in dados.items():
                    if chave in run.text:
                        run.text = run.text.replace(chave, valor)

    # Substituir nos parágrafos
    substituir_texto(doc.paragraphs)

    # Substituir nas tabelas
    for tabela in doc.tables:
        for linha in tabela.rows:
            for celula in linha.cells:
                substituir_texto(celula.paragraphs)

    return doc
