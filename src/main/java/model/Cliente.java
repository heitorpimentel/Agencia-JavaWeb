package model;

import java.time.LocalDate;

public class Cliente {
	private int id_cliente;
	private String nome;
	private String sexo;
	private LocalDate data_nasc;
	private String cpf;
	private String email;
	private String senha;
	private String telefone;
	
	public Cliente(int id_cliente, String nome, String sexo, LocalDate data_nasc, String cpf, String email, String senha,
			String telefone) {
		super();
		this.id_cliente = id_cliente;
		this.nome = nome;
		this.sexo = sexo;
		this.data_nasc = data_nasc;
		this.cpf = cpf;
		this.email = email;
		this.senha = senha;
		this.telefone = telefone;
	}

	public Cliente() {
		
	}

	public int getId_cliente() {
		return id_cliente;
	}

	public void setId_cliente(int id_cliente) {
		this.id_cliente = id_cliente;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public LocalDate getData_nasc() {
		return data_nasc;
	}

	public void setData_nasc(LocalDate data_nasc) {
		this.data_nasc = data_nasc;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	
	
}
