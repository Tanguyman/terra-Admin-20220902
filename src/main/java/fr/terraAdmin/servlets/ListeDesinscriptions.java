package fr.terraAdmin.servlets;

import java.io.IOException;
import java.util.ArrayList;

import fr.terraAdmin.beans.ClientsTerraBean;
import fr.terraAdmin.dao.ClientsTerraDao;
import fr.terraAdmin.dao.DaoException;
import fr.terraAdmin.dao.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ListeDesinscriptions
 */
public class ListeDesinscriptions extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListeDesinscriptions() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Database.Connect();
		ClientsTerraDao ctDao = new ClientsTerraDao();
		try {
			ArrayList<ClientsTerraBean> ctBeanCol = ctDao.getAllDesinscris();
			request.setAttribute("ctBeanCol", ctBeanCol);
		} catch (DaoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Dans la servlet ListAbonnes : " + e.getMessage());
			// Dans le site vitrine dire site en maintenance
			// Dans l’app ou le back office du site vitrine dire contacter le service
			// technique
			// m’envoyer un mail car je suis le dév donc le service technique
		}
		
		request.setAttribute("activeGestionAbonnes", "active");
		request.getRequestDispatcher("ListeDesinscriptions.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
