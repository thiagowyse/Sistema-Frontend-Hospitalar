document.addEventListener('DOMContentLoaded', function() {
  carregarPacientes();

  const buscarInput = document.getElementById('buscar-paciente');
  buscarInput.addEventListener('input', filtrarPacientes);
});

function carregarPacientes() {
  fetch("http://localhost:9090/paciente/findAll")
    .then(response => {
      if (!response.ok) {
        throw new Error("Erro na resposta da API");
      }
      return response.json();
    })
    .then(data => {
      const tabela = document.getElementById('lista-pacientes');
      tabela.innerHTML = '';

      if (!Array.isArray(data)) {
        throw new Error("Os dados recebidos não são uma lista de pacientes");
      }

      data.forEach(paciente => {
        const linha = document.createElement('tr');
        linha.setAttribute('data-id', paciente.idPaciente);
        linha.innerHTML = `
          <td>${paciente.nome}</td>
          <td>${paciente.endereco}</td>
          <td>${paciente.telefone}</td>
          <td>${paciente.dataNascimento}</td>
          <td>
            <button class="btn btn-info btn-sm" onclick="visualizarPaciente(this)">Visualizar</button>
            <button class="btn btn-warning btn-sm" onclick="editarPaciente(this)">Editar</button>
            <button class="btn btn-danger btn-sm" onclick="excluirPaciente(this)">Excluir</button>
          </td>
        `;
        tabela.appendChild(linha);
      });
    })
    .catch(error => {
      console.error("Erro ao buscar pacientes:", error);
      alert("Erro ao carregar pacientes. Verifique o console para detalhes.");
    });
}

function filtrarPacientes() {
  const filtro = document.getElementById('buscar-paciente').value.toLowerCase();
  const tabela = document.getElementById('lista-pacientes');
  const linhas = tabela.getElementsByTagName('tr');

  for (let i = 0; i < linhas.length; i++) {
    const nome = linhas[i].children[0]?.textContent.toLowerCase() || '';
    const contato = linhas[i].children[2]?.textContent.toLowerCase() || '';

    if (nome.includes(filtro) || contato.includes(filtro)) {
      linhas[i].style.display = '';
    } else {
      linhas[i].style.display = 'none';
    }
  }
}

function visualizarPaciente(botao) {
  const linha = botao.parentNode.parentNode;
  const nome = linha.children[0].textContent;
  const nascimento = linha.children[1].textContent;
  const contato = linha.children[2].textContent;

  document.getElementById('visualizarNome').textContent = nome;
  document.getElementById('visualizarNascimento').textContent = nascimento;
  document.getElementById('visualizarContato').textContent = contato;

  const modal = new bootstrap.Modal(document.getElementById('modalVisualizar'));
  modal.show();
}

function editarPaciente(botao) {
  const linha = botao.parentNode.parentNode;
  const nome = linha.children[0].textContent;
  const nascimento = linha.children[1].textContent;
  const contato = linha.children[2].textContent;

  document.getElementById('editarNome').value = nome;
  document.getElementById('editarNascimento').value = nascimento;
  document.getElementById('editarContato').value = contato;

  const modal = new bootstrap.Modal(document.getElementById('modalEditar'));
  modal.show();
}

function salvarEdicao() {
  const nome = document.getElementById('editarNome').value;
  const nascimento = document.getElementById('editarNascimento').value;
  const contato = document.getElementById('editarContato').value;

  fetch("http://localhost:9090/paciente/update", {
    method: 'PUT',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({ nome, nascimento, contato })
  })
  .then(response => response.json())
  .then(data => {
    alert("Paciente atualizado com sucesso!");
    carregarPacientes();
    const modal = bootstrap.Modal.getInstance(document.getElementById('modalEditar'));
    modal.hide();
  })
  .catch(error => {
    console.error("Erro ao editar paciente:", error);
    alert("Erro ao editar paciente.");
  });
}

function excluirPaciente(botao) {
  const linha = botao.parentNode.parentNode;
  const id = linha.getAttribute('data-id'); 

  if (confirm(`Tem certeza que deseja excluir o paciente com ID ${id}?`)) {
    fetch(`http://localhost:9090/paciente/delete/${id}`, {
      method: 'DELETE',
      headers: {
        'Content-Type': 'application/json'
      }
    })
    .then(response => response.json())
    .then(data => {
      alert("Paciente excluído com sucesso!");
      carregarPacientes();
    })
    .catch(error => {
      console.error("Erro ao excluir paciente:", error);
      alert("Erro ao excluir paciente.");
    });
  }
}
