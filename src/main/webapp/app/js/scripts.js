/*!
* Start Bootstrap - Simple Sidebar v6.0.6 (https://startbootstrap.com/template/simple-sidebar)
* Copyright 2013-2023 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-simple-sidebar/blob/master/LICENSE)
*/
// 
// Scripts
// 

window.addEventListener('DOMContentLoaded', event => {

	// Toggle the side navigation
	const sidebarToggle = document.body.querySelector('#sidebarToggle');
	if (sidebarToggle) {
		// Uncomment Below to persist sidebar toggle between refreshes
		// if (localStorage.getItem('sb|sidebar-toggle') === 'true') {
		//     document.body.classList.toggle('sb-sidenav-toggled');
		// }
		sidebarToggle.addEventListener('click', event => {
			event.preventDefault();
			document.body.classList.toggle('sb-sidenav-toggled');
			localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
		});
	}

});


document.addEventListener('DOMContentLoaded', function () {
    const editButtons = document.querySelectorAll('.edit-familia-btn');

    editButtons.forEach(button => {
        button.addEventListener('click', function (event) {
            event.preventDefault();

			// Pegar os valores dos atributos data-* do botão clicado			
			const logradouro = this.getAttribute('data-logradouro');
			const numero = this.getAttribute('data-numero');
			const complemento = this.getAttribute('data-complemento');
			const bairro = this.getAttribute('data-bairro');
			const cidade = this.getAttribute('data-cidade');
			const uf = this.getAttribute('data-uf');
			const cep = this.getAttribute('data-cep');

			// Preencher o formulário com os valores
			document.getElementById('inputLogradouro').value = logradouro;
			document.getElementById('inputNumero').value = numero;
			document.getElementById('inputComplemento').value = complemento;
			document.getElementById('inputBairro').value = bairro;
			document.getElementById('inputCidade').value = cidade;
			document.getElementById('uf').value = uf;
			document.getElementById('inputCep').value = cep;
			
			// IDs ocultos
            const idFamilia = this.getAttribute('data-idFamilia');
            document.getElementById('inputIdFamilia').value = idFamilia;

			const idEndereco = this.getAttribute('data-idEndereco');
            document.getElementById('inputIdEndereco').value = idEndereco;			
			
		});
	});
});

document.addEventListener('DOMContentLoaded', function () {
    const editButtons = document.querySelectorAll('.edit-paciente-btn');

    editButtons.forEach(button => {
        button.addEventListener('click', function (event) {
            event.preventDefault();

			// Pegar os valores dos atributos data-* do botão clicado
			const cpf = this.getAttribute('data-cpf');
			const nome = this.getAttribute('data-nome');
			const nascimento = this.getAttribute('data-nascimento');
			const telefone = this.getAttribute('data-telefone');
			const familia = this.getAttribute('data-idFamilia');
			
			// Preencher o formulário com os valores
			document.getElementById('inputCpf').value = cpf;
			document.getElementById('inputNome').value = nome;
			document.getElementById('inputNascimento').value = nascimento;
			document.getElementById('inputTelefone').value = telefone;
			document.getElementById('inputFamilia').value = familia;
			
			// IDs ocultos
            const idFamilia = this.getAttribute('data-idFamilia');
            document.getElementById('inputIdFamilia').value = idFamilia;

			const idPaciente = this.getAttribute('data-idPaciente');
            document.getElementById('inputIdPaciente').value = idPaciente;
			
            const idEndereco = this.getAttribute('data-idEndereco');
            document.getElementById('inputIdEndereco').value = idEndereco;
			
            const idTelefone = this.getAttribute('data-idTelefone');
            document.getElementById('inputIdTelefone').value = idTelefone;
			
		});
	});
});


document.addEventListener('DOMContentLoaded', function () {
    const editButtons = document.querySelectorAll('.edit-us-btn');

    editButtons.forEach(button => {
        button.addEventListener('click', function (event) {
            event.preventDefault();

            // Pega os dados do botão de edição
            const nome = this.getAttribute('data-nome');
            const telefone = this.getAttribute('data-telefone');
            const logradouro = this.getAttribute('data-logradouro');
            const numero = this.getAttribute('data-numero');
            const complemento = this.getAttribute('data-complemento');
            const bairro = this.getAttribute('data-bairro');
            const cidade = this.getAttribute('data-cidade');
            const uf = this.getAttribute('data-uf');
            const cep = this.getAttribute('data-cep');
            
            // Preenche o formulário com os dados
            document.getElementById('inputNome').value = nome;
            document.getElementById('inputTelefone').value = telefone;
            document.getElementById('inputLogradouro').value = logradouro;
            document.getElementById('inputNumero').value = numero;
            document.getElementById('inputComplemento').value = complemento;
            document.getElementById('inputBairro').value = bairro;
            document.getElementById('inputCidade').value = cidade;
            document.getElementById('uf').value = uf;
            document.getElementById('inputCep').value = cep;
            
            // IDs ocultos
            const idUnidadeSaude = this.getAttribute('data-idUnidadeSaude');
            document.getElementById('inputIdUS').value = idUnidadeSaude;
			
            const idEndereco = this.getAttribute('data-idEndereco');
            document.getElementById('inputIdEndereco').value = idEndereco;
			
            const idTelefone = this.getAttribute('data-idTelefone');
            document.getElementById('inputIdTelefone').value = idTelefone;
        });
    });
});

document.addEventListener('DOMContentLoaded', function () {
    const editButtons = document.querySelectorAll('.edit-especialidade-btn');

    editButtons.forEach(button => {
        button.addEventListener('click', function (event) {
            event.preventDefault();

            // Pega os dados do botão de edição
            const nome = this.getAttribute('data-nome');
  
            // Preenche o formulário com os dados
            document.getElementById('inputNome').value = nome;
           
            // IDs ocultos
            const idEspecialidade = this.getAttribute('data-idEspecialidade');
			document.getElementById('inputId').value = idEspecialidade;
			
			
        });
    });
});

document.addEventListener('DOMContentLoaded', function () {
    const editButtons = document.querySelectorAll('.edit-medico-btn');

    editButtons.forEach(button => {
        button.addEventListener('click', function (event) {
            event.preventDefault();

            // Pega os dados do botão de edição
            const crm = this.getAttribute('data-crm');
            const nome = this.getAttribute('data-nome');
            const telefone = this.getAttribute('data-telefone');
            const especialidade = this.getAttribute('data-idEspecialidade');
  
            // Preenche o formulário com os dados
            document.getElementById('inputCrm').value = crm;
            document.getElementById('inputNome').value = nome;
            document.getElementById('inputTelefone').value = telefone;
            document.getElementById('inputEspecialidade').value = especialidade;
           
            // IDs ocultos
            const idEspecialidade = this.getAttribute('data-idEspecialidade');
			document.getElementById('inputIdEspecialidade').value = idEspecialidade;
			
            const idTelefone = this.getAttribute('data-idTelefone');
			document.getElementById('inputIdTelefone').value = idTelefone;
			
			
        });
    });
});




