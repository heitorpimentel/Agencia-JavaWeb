function esconderData(){
    const soIdaRadio = document.getElementById('soIda');
    const idaVoltaRadio = document.getElementById('idaVolta')
    const divDataVolta = document.getElementById('dataDeVolta');

    soIdaRadio.addEventListener('change', () => {
        if (soIdaRadio.checked) {
            divDataVolta.style.display = 'none';
        }
    });                    
    idaVoltaRadio.addEventListener('change', () => {
        if (idaVoltaRadio.checked) {
            divDataVolta.style.display = 'block';
        }
    });
  }

  /* Cadastro */
  function mostrarSenha(){
    var senha = document.querySelector('#inputSenha')
    if(senha.type === "password"){
        senha.type = "text"
    } else if (senha.type === "text"){
        senha.type = "password";
    }
}

    const formataCPF = event => {
    let input = event.target;
    input.value = cpf(input.value);
    };

    const cpf = value => {
    if (!value) return "";
    value = value.replace(/\D/g, '');
    value = value.replace(/(\d{3})(\d)/, "$1.$2");
    value = value.replace(/(\d{3})(\d)/, "$1.$2");
    value = value.replace(/(\d{3})(\d{2})$/, "$1-$2");
    return value;
    };
    
    const formataTEL = event => {
    let input = event.target;
    input.value = telefone(input.value);
    };

    const telefone = value => {
    if (!value) return "";
    value = value.replace(/\D/g, '');
    value = value.replace(/(\d{2})(\d)/, "($1) $2");
    value = value.replace(/(\d)(\d{4})$/, "$1-$2");
    return value;
    };
    
    /*const input_busca = document.getElementById('searchInput')
    const tabela_nome = document.getElementById('tabela-nome')
    
    input_busca.addEventListener('keyup', () => {
		let expressao = input_busca.value.toLowerCase();
		let linhas = tabelas_nome.getElementByTagName('tr');
		
		for(let posicao in linhas){
			if(true === isNaN(posicao)){
				continue;
			}
			let conteudoLinha = linhas[posicao].innerHTML.toLowerCase();
			if(true === conteudoLinha.includes(expressao)){
				linhas[posicao].style.display = ''
			} else {
				linhas[posicao].style.display = 'none'
			}
		}
	})*/
    
    