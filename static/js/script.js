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

            document.getElementById('logradouro').value = data.logradouro || '';
            document.getElementById('bairro').value = data.bairro || '';
            document.getElementById('cidade').value = data.localidade || '';
            document.getElementById('estado').value = data.uf || '';
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

// Formatar data
document.getElementById('data_inicio').addEventListener('input', function (e) {
  let original = e.target.value;
  let input = original.replace(/\D/g, '');
  if (input.length > 2) {
    input = input.slice(0, 2) + '/' + input.slice(2);
  }
  if (input.length > 5) {
    input = input.slice(0, 5) + '/' + input.slice(5, 9);
  }
  console.log('Antes:', original, 'Depois:', input);
  e.target.value = input;
});

// Data fim
function calcularDataFim() {
  const dataInicioStr = document.getElementById('data_inicio').value;
  const prazoMesesStr = document.getElementById('prazo_meses').value;

  if (!dataInicioStr || !prazoMesesStr) return;

  const partesData = dataInicioStr.split('/');
  if (partesData.length !== 3) return;

  const dia = parseInt(partesData[0], 10);
  const mes = parseInt(partesData[1], 10) - 1; // JavaScript conta meses de 0 a 11
  const ano = parseInt(partesData[2], 10);
  const prazoMeses = parseInt(prazoMesesStr, 10);

  if (isNaN(dia) || isNaN(mes) || isNaN(ano) || isNaN(prazoMeses)) return;

  const data = new Date(ano, mes, dia);
  data.setMonth(data.getMonth() + prazoMeses);

  const diaFim = String(data.getDate()).padStart(2, '0');
  const mesFim = String(data.getMonth() + 1).padStart(2, '0');
  const anoFim = data.getFullYear();

  const dataFim = `${diaFim}/${mesFim}/${anoFim}`;
  document.getElementById('data_fim').value = dataFim;
}