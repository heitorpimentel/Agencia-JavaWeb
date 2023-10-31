<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alteração do cliente ${cliente.nome}</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
	crossorigin="anonymous"></script>
<script src="../scripts/funcoes.js"></script>
</head>
<body>
	<div class="container py-2">
		<h5 class="py-3">Alteração do cliente ${cliente.nome}</h5>
		
		<form action="editar" method="post" class="form-control bg-light">
			<fieldset>
				<legend>Dados do Cliente</legend>
				<input type="hidden" name="id_cliente" value="${cliente.id_cliente}">
				<div class="form-row">
					<div class="form-group col-md-12 pb-3">
						<label for="inputNome">Nome completo</label> <input type="text"
							class="form-control" id="inputNome" name="nome"
							placeholder="Nome completo" value="${cliente.nome}" required>
					</div>
					<div class="form-floating">
							<input type="text" readonly class="form-control-plaintext"
									id="floatingPlaintextInput" placeholder="name@example.com"
									value="${cliente.sexo}"> <label
									for="floatingPlaintextInput">Sexo</label>
					</div>
					<div class="col-sm-12 d-flex pb-2">
						<div class="form-check mx-2">
							<input class="form-check-input" type="radio" name="sexo"
								id="gridRadios1" value="Masculino"> <label
								class="form-check-label" for="gridRadios1"> Masculino </label>
						</div>
						<div class="form-check mx-2">
							<input class="form-check-input" type="radio" name="sexo"
								id="gridRadios2" value="Feminino"> <label
								class="form-check-label" for="gridRadios2"> Feminino </label>
						</div>
						<div class="form-check mx-2">
							<input class="form-check-input" type="radio" name="sexo"
								id="gridRadios3" value="Outro"> <label
								class="form-check-label" for="gridRadios3"> Outro </label>
						</div>
					</div>
					<div class="form-group col-md-12">
						<label for="inputPassword">Data de nascimento</label> <input
							type="date" class="form-control data-nasc" id="inputPassword"
							name="data_nasc" value="${cliente.data_nasc}" required>
					</div>
					<div class="form-group col-md-12">
						<label for="inputCpf">CPF</label> <input type="text"
							class="form-control" id="inputCpf" name="cpf" value="${cliente.cpf}"
							placeholder="000.000.000-00" onkeyup="formataCPF(event)"
							minlength="14" maxlength="14" required>
					</div>
				</div>

				<div class="form-row">
					<div class="form-group col-md-12">
						<label for="inputEmail">E-mail</label> <input class="form-control"
							type="email" name="email" id="inputEmail"
							placeholder="example@email.com" value="${cliente.email}" required>
					</div>
					<div class="form-group col-md-12">
						<label for="inputSenha">Senha</label> <input type="password"
							name="senha" class="form-control" id="inputSenha"
							placeholder="Mínimo 8 caracteres" pattern=".{8,}"
							title="Oito ou mais caracteres" value="${cliente.senha}" required>
						<div class="col-md-6">
							<input class="col-1 form-check-input" type="checkbox"
								id="verSenha" onclick="mostrarSenha()"> <label
								class="col form-check-label" for="verSenha">Mostrar
								senha</label>
						</div>
					</div>
					<div class="form-group col-md-12">
						<label for="inputTel">Telefone</label> <input type="text"
							class="form-control" id="inputTel" name="telefone" placeholder="(xx) xxxxx-xxxx"
							onkeyup="formataTEL(event)" minlength="14" maxlength="15"
							value="${cliente.telefone}" required>
					</div>
					<div class=" py-2">
						<input type="submit" value="Atualizar Cliente"
							class="btn btn-primary">
					</div>

				</div>

			</fieldset>
		</form>
	</div>

</body>
</html>