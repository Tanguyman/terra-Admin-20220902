package fr.terraAdmin.servlets;

import java.io.IOException;

import fr.terraAdmin.dao.ClientsTerraDao;
import fr.terraAdmin.dao.DaoException;
import fr.terraAdmin.dao.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class Dashboard
 */
public class Dashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Dashboard() {
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
		
		HttpSession session = request.getSession(true);
		Database.Connect();
		
		ClientsTerraDao ctd = new ClientsTerraDao();
		try {
			/*
			 * COURBES : Nouveaux abonnés
			 */
			String mensuel = ctd.countAllNewSubscribersForATypeOfSubscriptionPerEachMonthOfTheCurrentYear(10, 11, 12);
			String annuel = ctd.countAllNewSubscribersForATypeOfSubscriptionPerEachMonthOfTheCurrentYear(20, 21, 22);
			String surMesure = ctd.countAllNewSubscribersForATypeOfSubscriptionPerEachMonthOfTheCurrentYear(30, 31, 32);
			System.out.println("Mensuel : " + mensuel);
			System.out.println("Annuel : " + annuel);
			System.out.println("Sur-mesure : " + surMesure);
			/*
			 * COURBES : Désinscriptions
			 */
			String mensuelD = ctd.countAllUnsubscribesForATypeOfSubscriptionPerEachMonthOfTheCurrentYear(10, 11, 12);
			String annuelD = ctd.countAllUnsubscribesForATypeOfSubscriptionPerEachMonthOfTheCurrentYear(20, 21, 22);
			String surMesureD = ctd.countAllUnsubscribesForATypeOfSubscriptionPerEachMonthOfTheCurrentYear(30, 31, 32);
			System.out.println("MensuelD : " + mensuelD);
			System.out.println("AnnuelD : " + annuelD);
			System.out.println("Sur-mesureD : " + surMesureD);
			/*
			 * CAMEMBERT : Abonnement mensuel, annuel, sur-mesure
			 */		
			String matSubscription = ctd.CountMonthlyAnnualAndTailoredSubscription();
			System.out.println("Camembert : " + matSubscription);
			
			request.setAttribute("mensuel", mensuel);
			request.setAttribute("annuel", annuel);
			request.setAttribute("surMesure", surMesure);
			request.setAttribute("mensuelD", mensuelD);
			request.setAttribute("annuelD", annuelD);
			request.setAttribute("surMesureD", surMesureD);
			request.setAttribute("matSubscription", matSubscription);
			request.setAttribute("mat", "'Mois', 'Année', 'Sur-mesure'");
			/*
			 * ABONNÉS PERDUS
			 */
			
		} catch (DaoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("activeDashboard", "active");
		request.getRequestDispatcher("dashboard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
