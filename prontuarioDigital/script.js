const formularioLogin = document.getElementById('formularioLogin');
const erroMensagem = document.getElementById('erroMensagem');

formularioLogin.addEventListener('submit', function(event) {
  event.preventDefault();

  const usuario = document.getElementById('email').value;
  const senha = document.getElementById('senha').value;

  // Simulação de verificação de login
  if (usuario === 'admin' && senha === '1234') {
    alert('Login realizado com sucesso!');
    window.location.href = 'listagemPacientes.html'; // redireciona
  } else {
    erroMensagem.style.display = 'block';
  }
});

