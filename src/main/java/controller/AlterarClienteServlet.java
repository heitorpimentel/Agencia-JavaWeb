package controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Cliente;
import model.ClienteDAO;

@WebServlet("/user/editar")
public class AlterarClienteServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		    int idCliente = Integer.parseInt(request.getParameter("id_cliente"));
		    // Restante do seu código
		    ClienteDAO cdao = new ClienteDAO();	
		    Cliente clienteSelecionado = cdao.listarClienteId(idCliente);
		    
		    request.setAttribute("cliente", clienteSelecionado);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("alterarcadastro.jsp");
		dispatcher.forward(request, response);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Date dataNasc = Date.valueOf(request.getParameter("data_nasc"));
		
		Cliente cli = new Cliente();
		cli.setNome(request.getParameter("nome"));
		cli.setSexo(request.getParameter("sexo"));
		cli.setData_nasc(dataNasc.toLocalDate());
		cli.setCpf(request.getParameter("cpf"));
		cli.setEmail(request.getParameter("email"));
		cli.setSenha(request.getParameter("senha"));
		cli.setTelefone(request.getParameter("telefone"));
		cli.setId_cliente(Integer.parseInt(request.getParameter("id_cliente")));
		
		ClienteDAO cdao = new ClienteDAO();
		cdao.atualizarCliente(cli);
		
		response.sendRedirect("AreaADMIN");
	}

}
