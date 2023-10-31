<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Área ADM HP Viagens</title>


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
<style>
	@import url("https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css");
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-light sticky-top navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Área ADM</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav m-auto">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">Gestão Clientes</a></li>
					<li class="nav-item disable"><a class="nav-link">Gestão
							Viagens</a></li>
					<li class="nav-item disable"><a class="nav-link">Gestão
							de Pagamentos</a></li>
					<li class="nav-item disable"><a class="nav-link">Gestão
							de Reservas</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container">
		<h3 class="py-3">Cadastro de cliente</h3>
		
		<form action="SalvarCliente" method="post" class="form-control bg-light">
			<fieldset>
				<legend>Dados do Cliente</legend>
				<div class="form-row">
					<div class="form-group col-md-12 pb-3">
						<label for="inputNome">Nome completo</label> <input type="text"
							class="form-control" id="inputNome" name="nome"
							placeholder="Nome completo" required>
					</div>
					<div class="col-sm-12 d-flex pb-2">
						<div class="form-check mx-2">
							<input class="form-check-input" type="radio" name="sexo"
								id="gridRadios1" value="Masculino" checked> <label
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
							name="data_nasc" placeholder="Data de nascimento" required>
					</div>
					<div class="form-group col-md-12 py-2">
						<label for="inputCpf">CPF</label> <input type="text"
							class="form-control" id="inputCpf" name="cpf"
							placeholder="000.000.000-00" onkeyup="formataCPF(event)"
							minlength="14" maxlength="14" required>
					</div>
				</div>

				<div class="form-row py-2">
					<div class="form-group col-md-12">
						<label for="inputEmail">E-mail</label> <input class="form-control"
							type="email" name="email" id="inputEmail"
							placeholder="example@email.com" required>
					</div>
					<div class="form-group col-md-12 py-2">
						<label for="inputSenha">Senha</label> <input type="password"
							name="senha" class="form-control" id="inputSenha"
							placeholder="Mínimo 8 caracteres" pattern=".{8,}"
							title="Oito ou mais caracteres" required>
						<div class="">
							<input class=" form-check-input" type="checkbox"
								id="verSenha" onclick="mostrarSenha()"> <label
								class="col form-check-label" for="verSenha">Mostrar
								senha</label>
						</div>
					</div>
					<div class="col-md-12 form-group py-2">
						
						<div class="form-group">
							<label for="inputTel">Telefone</label> <input type="text"
								class="form-control" id="inputTel" name="telefone" placeholder="(xx) xxxxx-xxxx"
								onkeyup="formataTEL(event)" minlength="14" maxlength="15"
								required>
						</div>
					</div>
					<div class="py-3">
						<input type="submit" value="Cadastrar Cliente"
							class="btn btn-primary">
					</div>

				</div>

			</fieldset>
		</form>

		<br>
		<h5>Clientes cadastrados</h5>
		
		<div class="table-responsive mb-3">
			<table class="table table-striped">
				<thead class="table-dark">
					<tr>
						<th>#</th>
						<th>Nome</th>
						<th>CPF</th>
						<th>Data de Nascimento</th>
						<th>Sexo</th>
						<th>Email</th>
						<th>Telefone</th>
						<th>Ações</th>
					</tr>
				</thead>
				<tbody id="tabela-nome">
					
					<jstl:forEach items="${listaClientes}" var="cliente">
						<tr>
							<td>${cliente.id_cliente}</td>
							<td>${cliente.nome}</td>
							<td>${cliente.cpf}</td>
							<td>${cliente.data_nasc}</td>
							<td>${cliente.sexo}</td>
							<td>${cliente.email}</td>
							<td>${cliente.telefone}</td>
							<td><a href="editar?id_cliente=${cliente.id_cliente}" class="btn btn-warning"><i class="bi bi-pencil-square"></i></a>
								<a href="excluir?id_cliente=${cliente.id_cliente}"	onclick="return confirm('Deseja Excluir?')"
								class="btn btn-danger"><i class="bi bi-trash"></i></a>
							</td>
						</tr>
					</jstl:forEach>

				</tbody>
			</table>
		</div>
	</div>
</body>
</html>