package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class ClienteDAO {
	Connection conexao = null;
	PreparedStatement pstm = null;

    public void criarCliente(Cliente cliente) {
		String sql = "INSERT INTO cliente (nome, sexo, data_nasc, cpf, email, senha, telefone) VALUES (?, ?, ?, ?, ?, ?, ?)";
		try{
			conexao = Conexao.createConnectionToMySQL();
			pstm = conexao.prepareStatement(sql);
			
			pstm.setString(1, cliente.getNome());
			pstm.setString(2, cliente.getSexo());
			Date data = Date.valueOf(cliente.getData_nasc());
			pstm.setDate(3, data);
			pstm.setString(4, cliente.getCpf());
			pstm.setString(5, cliente.getEmail());
			pstm.setString(6, cliente.getSenha());
			pstm.setString(7, cliente.getTelefone());
			pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null) {
					pstm.close();
				}
				if (conexao != null) {
					conexao.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
    
	public void atualizarCliente(Cliente cliente) {
		String sql = "UPDATE cliente SET nome = ?, sexo = ?, data_nasc = ?, cpf = ?, email = ?, senha = ?, telefone = ? WHERE id_cliente = ?";
		try{
			conexao = Conexao.createConnectionToMySQL();
			pstm = conexao.prepareStatement(sql);
			
			pstm.setString(1, cliente.getNome());
			pstm.setString(2, cliente.getSexo());
			Date data = Date.valueOf(cliente.getData_nasc());
			pstm.setDate(3, data);
			pstm.setString(4, cliente.getCpf());
			pstm.setString(5, cliente.getEmail());
			pstm.setString(6, cliente.getSenha());
			pstm.setString(7, cliente.getTelefone());
			pstm.setInt(8, cliente.getId_cliente());
			pstm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null) {
					pstm.close();
				}
				if (conexao != null) {
					conexao.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public void excluirCliente(int id) {
		String sql = "DELETE FROM cliente WHERE id_cliente = ?";
		try {
			conexao = Conexao.createConnectionToMySQL();
			pstm = conexao.prepareStatement(sql);
			pstm.setInt(1, id);
			pstm.execute();
		} catch (Exception e) {
			e.getMessage();			
		} finally {
			try {
				if (pstm != null) {
					pstm.close();
				}
				if (conexao != null) {
					conexao.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public List<Cliente> listarCliente() {
		String sql = "SELECT * FROM cliente";
		List<Cliente> clientes = new ArrayList<Cliente>();
		ResultSet resultado = null;
		try {
			conexao = Conexao.createConnectionToMySQL();
			pstm = conexao.prepareStatement(sql);
			resultado = pstm.executeQuery();
			while (resultado.next()) {
				Cliente cliente = new Cliente();
				cliente.setId_cliente(resultado.getInt("id_cliente"));
				cliente.setNome(resultado.getString("nome"));
				cliente.setSexo(resultado.getString("sexo"));
				cliente.setData_nasc(resultado.getDate("data_nasc").toLocalDate());
				cliente.setCpf(resultado.getString("cpf"));
				cliente.setEmail(resultado.getString("email"));
				cliente.setSenha(resultado.getString("senha"));
				cliente.setTelefone(resultado.getString("telefone"));
				clientes.add(cliente);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (resultado != null) {
					resultado.close();
				}
				if (pstm != null) {
					pstm.close();
				}
				if (conexao != null) {
					conexao.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return clientes;
	}
	
	public Cliente listarClienteId(int id) {
		String sql = "SELECT * FROM cliente WHERE id_cliente = ?";
		Cliente cliente = new Cliente();
		ResultSet resultado = null;

		try {
			conexao = Conexao.createConnectionToMySQL();
			pstm = conexao.prepareStatement(sql);
			pstm.setInt(1, id);
			resultado = pstm.executeQuery();
			resultado.next();
					
			cliente.setNome(resultado.getString("nome"));
			cliente.setSexo(resultado.getString("sexo"));
			cliente.setData_nasc((resultado.getDate("data_nasc").toLocalDate()));
			cliente.setCpf(resultado.getString("cpf"));
			cliente.setEmail(resultado.getString("email"));
			cliente.setSenha(resultado.getString("senha"));
			cliente.setTelefone(resultado.getString("telefone"));
			cliente.setId_cliente(resultado.getInt("id_cliente"));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (resultado != null) {
					resultado.close();
				}
				if (pstm != null) {
					pstm.close();
				}
				if (conexao != null) {
					conexao.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return cliente;
	}
	
}
