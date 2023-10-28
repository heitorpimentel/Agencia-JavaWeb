package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ClienteDAO;
import model.Conexao;

/**
 * Servlet implementation class ExcluirClienteServlet
 */
@WebServlet("/user/excluir")
public class ExcluirClienteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExcluirClienteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idCliente = Integer.parseInt(request.getParameter("id_cliente"));
		
		
		if (existemReservasDoCliente(idCliente)) {
            // Se existirem registros relacionados, envia para página de erro
            response.sendRedirect("error.jsp");
        } else {

		ClienteDAO cdao = new ClienteDAO();

		cdao.excluirCliente(idCliente);

		response.sendRedirect("AreaADMIN");
		
        }

        
	}
	
	public boolean existemReservasDoCliente(int idCliente) {
        Connection conexao = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;

        try {
            conexao = Conexao.createConnectionToMySQL();
            String sql = "SELECT COUNT(*) FROM reserva WHERE id_cliente = ?";
            pstm = conexao.prepareStatement(sql);
            pstm.setInt(1, idCliente);
            rs = pstm.executeQuery();

            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Trate a exceção conforme necessário
        } finally {
            // Feche os recursos (ResultSet, PreparedStatement e Connection) aqui
        }

        return false;
    }

}
