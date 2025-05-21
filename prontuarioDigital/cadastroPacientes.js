const formularioCadastro = document.getElementById('formCadastroPaciente');

formularioCadastro.addEventListener('submit', function(event) {
  event.preventDefault();

  const nome = document.getElementById('nome').value;
  const dataNascimento = document.getElementById('dataNascimento').value;
  const endereco = document.getElementById('endereco').value;
  const telefone = document.getElementById('telefone').value;
  const outrosDados = document.getElementById('outrosDados').value;

  // Simulação de verificação do cadastro
  if (nome && dataNascimento && endereco && telefone) {
    const paciente = {
      nome,
      dataNascimento,
      endereco,
      telefone,
      outrosDados
    };

    let pacientes = JSON.parse(localStorage.getItem('pacientes')) || [];

    pacientes.push(paciente);

    localStorage.setItem('pacientes', JSON.stringify(pacientes));

    alert('Paciente cadastrado com sucesso!');

    window.location.href = 'listagemPacientes.html';
  } else {
    alert('Por favor, preencha todos os campos obrigatórios.');
  }
});
