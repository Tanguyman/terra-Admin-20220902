package fr.terraAdmin.servlets;

import java.io.IOException;

import fr.terraAdmin.dao.CoordonneesTerraDao;
import fr.terraAdmin.dao.Database;
import fr.terraAdmin.dao.LivreDOrDao;
import fr.terraAdmin.dao.LivreDOrLogosDao;
import fr.terraAdmin.dao.OffresDao;
import fr.terraAdmin.dao.SliderDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GestionFront
 */
public class GestionFront extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GestionFront() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		
		Database.Connect();
		CoordonneesTerraDao ctDao = new CoordonneesTerraDao();
		SliderDao sDao = new SliderDao();
		LivreDOrDao lDao = new LivreDOrDao();
		LivreDOrLogosDao llDao = new LivreDOrLogosDao();
		OffresDao oDao = new OffresDao();
		
		try {

			request.setAttribute("cb", ctDao.getById(1));
			request.setAttribute("sbCol", sDao.getAll());
			request.setAttribute("lbCol", lDao.getAll());
			request.setAttribute("llbCol", llDao.getAll());
			request.setAttribute("oCol", oDao.getAll());

			// System.out.println(lDao.getAll());
			
		} catch (Exception e) {
			
			e.printStackTrace();
			System.out.println("Dans la servlet ListAbonnes : " + e.getMessage());
			// Dans le site vitrine dire site en maintenance
			// Dans l’app ou le back office du site vitrine dire contacter le service
			// technique
			// m’envoyer un mail car je suis le dév donc le service technique
		}
		
		request.setAttribute("activeGestionFront", "active");
		request.getRequestDispatcher("gestionFront.jsp").forward(request, response);
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
