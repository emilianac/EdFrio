// Formatar CPF para 000.000.000-00
document.getElementById('cpf').addEventListener('input', function(e) {
    let valor = e.target.value.replace(/\D/g, ''); // Remove tudo que não for dígito
    valor = valor.slice(0, 11); // Limita para 11 dígitos

    let cpfFormatado = valor;

    if (valor.length > 9) {
        cpfFormatado = valor.replace(/(\d{3})(\d{3})(\d{3})(\d{2})/, '$1.$2.$3-$4');
    } else if (valor.length > 6) {
        cpfFormatado = valor.replace(/(\d{3})(\d{3})(\d{1,3})/, '$1.$2.$3');
    } else if (valor.length > 3) {
        cpfFormatado = valor.replace(/(\d{3})(\d{1,3})/, '$1.$2');
    }
    e.target.value = cpfFormatado;
});

// Buscar CEP e preencher campos
function buscarCep() {
    const cep = document.getElementById('cep').value.replace(/\D/g, '');

    if (cep.length !== 8) {
        alert('CEP inválido!');
        return;
    }
    if (!/^\d{8}$/.test(cep)) {
        alert('CEP deve conter apenas números!');
        return;
    }
    const cepLimpo = cep.replace(/\D/g, ''); // remove tudo que não é número
    const url = `https://viacep.com.br/ws/${cepLimpo}/json/`;

    fetch(url)
        .then(response => response.json())
        .then(data => {
            if (data.erro) {
                alert('CEP não encontrado!');
                return;
            }

            const estados = {
                'AC': 'Acre',
                'AL': 'Alagoas',
                'AP': 'Amapá',
                'AM': 'Amazonas',
                'BA': 'Bahia',
                'CE': 'Ceará',
                'DF': 'Distrito Federal',
                'ES': 'Espírito Santo',
                'GO': 'Goiás',
                'MA': 'Maranhão',
                'MT': 'Mato Grosso',
                'MS': 'Mato Grosso do Sul',
                'MG': 'Minas Gerais',
                'PA': 'Pará',
                'PB': 'Paraíba',
                'PR': 'Paraná',
                'PE': 'Pernambuco',
                'PI': 'Piauí',
                'RJ': 'Rio de Janeiro',
                'RN': 'Rio Grande do Norte',
                'RS': 'Rio Grande do Sul',
                'RO': 'Rondônia',
                'RR': 'Roraima',
                'SC': 'Santa Catarina',
                'SP': 'São Paulo',
                'SE': 'Sergipe',
                'TO': 'Tocantins'
            };

            document.getElementById('logradouro').value = data.logradouro || '';
            document.getElementById('bairro').value = data.bairro || '';
            document.getElementById('cidade').value = data.localidade || '';

            const nomeEstado = estados[data.uf] || data.uf;
            document.getElementById('estado').value = nomeEstado;
        })
        .catch(error => console.error('Erro ao buscar CEP:', error));
    }

// Formatar RG
const rgInput = document.getElementById('rg');

  rgInput.addEventListener('input', () => {
    let rg = rgInput.value;

    // Remove tudo que não for número ou letra (alguns RGs têm letra no final)
    rg = rg.replace(/[^0-9a-zA-Z]/g, '');

    // Aplica máscara: 12.345.678-9
    if (rg.length > 2) rg = rg.slice(0, 2) + '.' + rg.slice(2);
    if (rg.length > 6) rg = rg.slice(0, 6) + '.' + rg.slice(6);
    if (rg.length > 10) rg = rg.slice(0, 10) + '-' + rg.slice(10, 11);

    rgInput.value = rg;

    });

// Data fim
function calcularDataFim() {
  const dataInicioStr = document.getElementById('data_inicio').value;
  const prazoMesesStr = document.getElementById('prazo_meses').value;

  if (!dataInicioStr || !prazoMesesStr) return;

  const partesData = dataInicioStr.split('-');
  if (partesData.length !== 3) return;

  const ano = parseInt(partesData[0], 10);
  const mes = parseInt(partesData[1], 10) - 1;
  const dia = parseInt(partesData[2], 10);
  const prazoMeses = parseInt(prazoMesesStr, 10);

  if (isNaN(dia) || isNaN(mes) || isNaN(ano) || isNaN(prazoMeses)) return;

  const data = new Date(ano, mes, dia);
  data.setMonth(data.getMonth() + prazoMeses);

  const diaFim = String(data.getDate()).padStart(2, '0');
  const mesFim = String(data.getMonth() + 1).padStart(2, '0');
  const anoFim = data.getFullYear();

  const dataFim = `${anoFim}-${mesFim}-${diaFim}`; // formato para input type="date"
  document.getElementById('data_fim').value = dataFim;
}

function tipoVenda() {
  const tipo = document.getElementById('tipo').value;
  const objeto_resfriador = document.getElementById('objeto_resfriador');
  const objeto_ordenhadeira = document.getElementById('objeto_ordenhadeira');

  if (tipo === 'venda_res') {
    objeto_resfriador.style.display = 'block';
    objeto_ordenhadeira.style.display = 'none';
  } else if (tipo === 'venda_ord') {
    objeto_resfriador.style.display = 'none';
    objeto_ordenhadeira.style.display = 'block';
  } else {
    objeto_resfriador.style.display = 'none';
    objeto_ordenhadeira.style.display = 'none';
  }
}

function entrada() {
    const tipo = document.getElementById('tipo_entrada').value;
    const campoValorEntrada = document.getElementById('entrada_valor');
    const inputValorEntrada = document.getElementById('valor_entrada');

    if (tipo === 'sim') {
        campoValorEntrada.style.display = 'block';
        inputValorEntrada.required = true;
    } else {
        campoValorEntrada.style.display = 'none';
        inputValorEntrada.required = false;
        inputValorEntrada.value = '';
    }
}

function valorParcela() {
    const valor_entrada = parseFloat(document.getElementById('valor_entrada').value) || 0;
    const valor_total = parseFloat(document.getElementById('valor_total').value);
    const prazo_meses = parseInt(document.getElementById('prazo_meses').value, 10);

    if (!isNaN(valor_total) && !isNaN(prazo_meses) && prazo_meses > 0) {
        const valorFinanciado = valor_total - valor_entrada;
        const parcela = (valorFinanciado / prazo_meses);
        document.getElementById('valor').value = parcela;
    } else {
        document.getElementById('valor').value = '';
    }
}
