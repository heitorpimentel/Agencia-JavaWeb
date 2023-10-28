package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Cliente;
import model.ClienteDAO;

/**
 * Servlet implementation class ClienteServlet
 */
@WebServlet("/user/AreaADMIN")
public class ListarClienteServlet extends HttpServlet {
	
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	
		List<Cliente> agenda = new ArrayList<Cliente>();
		ClienteDAO cdao = new ClienteDAO();		
		agenda = cdao.listarCliente();		
		request.setAttribute("listaClientes", agenda);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("cadastro2.jsp");
		dispatcher.forward(request, response);
		
	}
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	response.sendRedirect("AreaADMIN");
    }
}
