package fr.terraAdmin.servlets;

import java.io.IOException;

import fr.terraAdmin.beans.AdminBean;
import fr.terraAdmin.dao.AdminDao;
import fr.terraAdmin.dao.DaoException;
import fr.terraAdmin.dao.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class Connexion
 */
public class Connexion extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private String msg = "";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Connexion() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());

		HttpSession session = request.getSession(true);
		String names[] = session.getValueNames();
		for ( int i = 0, n = names.length; i < n; i++ ) {
			String key = names[i];
			System.out.println("Session key (Index servlet) : " + key + " -> Session value : " + session.getValue(key));
		}
		
		Database.Connect();
		
		if (request.getParameter("buttonConnection") != null) {

			// Récupérer les paramètres du Header (POST)
			String mail = request.getParameter("username");
			String password = request.getParameter("password");

			// TEST DE SÉCURITÉ
			try {
				AdminDao aDao = new AdminDao();
				AdminBean aBean = aDao.isLoginCorrect(mail, password);
				session.setAttribute("messageConnexion", msg);

				if (aBean != null) {
					
					if ( aBean.isArchiver() ) {
						session.setAttribute("messageConnexion", "Une personne a tenter de se connecter "
								+ "plusieurs fois à votre compte. Afin de sécuriser vos données, "
								+ "nous avons bloqué votre compte temporairement. Si vous n’avez pas "
								+ "reçu le mail de réactivation alors cliquez ci-dessous svp.</br></br>"
								+ "<button>Recevoir le mail de réactivation</button>");
						response.sendRedirect("Index");
					} else {
						session.setAttribute("isConnected", true);
						session.setAttribute("aBean", aBean);
						session.removeAttribute("messageConnexion");
						response.sendRedirect("Dashboard");						
					}

				} else {

					if (session.getAttribute("messageConnexion").equals("")) {
						
						response.sendRedirect("Index");
						
						msg = "Il vous reste 2 tentatives";
						session.setAttribute("messageConnexion", msg);
						
					} else if (session.getAttribute("messageConnexion").equals("Il vous reste 2 tentatives")) {
						
						response.sendRedirect("Index");
						
						msg = "Attention, plus qu'une tentative pour vous connecter";
						session.setAttribute("messageConnexion", msg);
						
					} else if (session.getAttribute("messageConnexion")
							.equals("Attention, plus qu'une tentative pour vous connecter")) {
						
						response.sendRedirect("Index");
						
						msg = "Afin de protéger vos données, votre compte est bloqué.</br>"
								+ "Vous avez reçu un mail de réactivation.</br>"
								+ "Sinon, veuillez contacter l’administrateur.";
						session.setAttribute("messageConnexion", msg);
						
						if ( aDao.isMailInDatabase(mail) ) {
							aDao.blockAccount(mail);
						}
					}
				}

			} catch (DaoException e) {

				e.printStackTrace();
				System.out.println("Dans la servlet connexion : " + e.getMessage());
				request.setAttribute("erreur", e.getMessage());
				// Dans le site vitrine dire site en maintenance
				// Dans l’app ou le back office du site vitrine dire contacter le service
				// technique
				// m’envoyer un mail car je suis le dév donc le service technique
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
