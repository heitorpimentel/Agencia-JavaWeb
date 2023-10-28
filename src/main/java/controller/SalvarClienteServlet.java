package controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Cliente;
import model.ClienteDAO;

@WebServlet("/user/SalvarCliente")
public class SalvarClienteServlet extends HttpServlet {

    public SalvarClienteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
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
		
		response.sendRedirect("AreaADMIN");
	}
//nom, sexo, dataNas, cpf,emailmsenha,telefone
}
