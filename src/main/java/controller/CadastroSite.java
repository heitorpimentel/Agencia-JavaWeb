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

/**
 * Servlet implementation class CadastroSite
 */
@WebServlet("/user/CadastroSite")
public class CadastroSite extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("login.html");
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
		
		ClienteDAO cdao = new ClienteDAO();
		cdao.criarCliente(cli);
		
		response.sendRedirect("CadastroSite");
	}

}
