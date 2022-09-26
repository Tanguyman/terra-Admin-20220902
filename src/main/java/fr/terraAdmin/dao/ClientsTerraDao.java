package fr.terraAdmin.dao;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import fr.terraAdmin.beans.BeanException;
import fr.terraAdmin.beans.ClientsTerraBean;
import fr.terraAdmin.tools.DateManipulator;
import fr.terraAdmin.tools.PasswordHash;

public class ClientsTerraDao {

	// CREATE if !exist else UPDATE
	public String save(ClientsTerraBean o) throws DaoException {

		Connection connexion = null;
		PreparedStatement ps = null;

		try {
			
			Database.Connect();
			connexion = Database.connexion;
			
			ClientsTerraDao ctDao = new ClientsTerraDao();
			
			if (o.getId() != 0) {
				
				if ( !ctDao.getById(o.getId()).getMail().equals(o.getMail()) ) {
					
					if ( ctDao.getByMail(o.getMail()) != null ) {
						
						String msg = "<div id=\"alertSuccess\" class=\"alert alert-danger text-center\" "
								+ "role=\"alert\">Cette email est déjà pris !</div>";
						return msg;
						
					} else {
						
						ps = Database.connexion
								.prepareStatement("UPDATE clientsTerra SET dateMAJ=?, "
										+ "civilite=?, nom=?, prenom=?, tel=?, mail=?, "
										+ "abonnement=?, statut=?, archiver=?, commentaire=? "
										+ "WHERE id=?");
		
						ps.setDate(1, DateManipulator.dateInSql());
						ps.setInt(2, o.getCivilite());
						ps.setString(3, o.getNom());
						ps.setString(4, o.getPrenom());
						ps.setString(5, o.getTel());
						ps.setString(6, o.getMail());
						ps.setInt(7, o.getAbonnement());
						ps.setInt(8, o.getStatut());
						ps.setBoolean(9, o.isArchiver());
						ps.setString(10, o.getCommentaire());
		
						ps.setInt(11, o.getId());
		
						ps.executeUpdate();
						connexion.commit();
					}
					
				} else {
					
					ps = Database.connexion
							.prepareStatement("UPDATE clientsTerra SET dateMAJ=?, "
									+ "civilite=?, nom=?, prenom=?, tel=?, mail=?, "
									+ "abonnement=?, statut=?, archiver=?, commentaire=? "
									+ "WHERE id=?");
	
					ps.setDate(1, DateManipulator.dateInSql());
					ps.setInt(2, o.getCivilite());
					ps.setString(3, o.getNom());
					ps.setString(4, o.getPrenom());
					ps.setString(5, o.getTel());
					ps.setString(6, o.getMail());
					ps.setInt(7, o.getAbonnement());
					ps.setInt(8, o.getStatut());
					ps.setBoolean(9, o.isArchiver());
					ps.setString(10, o.getCommentaire());
	
					ps.setInt(11, o.getId());
	
					ps.executeUpdate();
					connexion.commit();
					
				}

			} else {
				
				if ( !ctDao.getById(o.getId()).getMail().equals(o.getMail()) ) {
					
					String msg = "<div id=\"alertSuccess\" class=\"alert alert-danger text-center\" "
							+ "role=\"alert\">Cette email est déjà pris !</div>";
					return msg;
					
				} else {
					
					ps = Database.connexion
							.prepareStatement("INSERT INTO clientsTerra "
									+ "(dateMAJ,"
									+ "civilite, nom, prenom, tel, mail, "
									+ "abonnement, statut, archiver, commentaire, dateEnregistrement)"
									+ "VALUES(?,?,"
									+ "?,?,?,?,?,?,"
									+ "?,?,?)");
					
					ps.setDate(1, o.getDateEnregistrement());
					ps.setDate(2, o.getDateMAJ());
					ps.setInt(3, o.getCivilite());
					ps.setString(4, o.getNom());
					ps.setString(5, o.getPrenom());
					ps.setString(6, o.getTel());
					ps.setString(7, o.getMail());
					String pHash = PasswordHash.generatePassword(o.getPassword());
					System.out.println(pHash);
					ps.setString(8, pHash);
					ps.setInt(9, o.getAbonnement());
					ps.setInt(10, o.getStatut());
					ps.setBoolean(11, o.isArchiver());
					ps.setString(12, o.getCommentaire());
					
					ps.executeUpdate();
					connexion.commit();
				}

			}

			System.out.println("SAVED OK");
			String msg = "<div id=\"alertSuccess\" class=\"alert alert-success text-center\" "
					+ "role=\"alert\">La fiche a bien été mise à jour</div>";
			return msg;

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SAVED NO");
			try {
				if (connexion != null) {
					connexion.rollback(); // Annuler la transaction
				}
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
			throw new DaoException("Impossible de communiquer avec la base de données.");
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvalidKeySpecException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	// READ / RETRIEVE ALL
	public ArrayList<ClientsTerraBean> getAllAbonnes() throws DaoException {

		ArrayList<ClientsTerraBean> list = new ArrayList<>();
		Connection connexion = null;
		Statement st = null;
		ResultSet rs = null;

		try {

			connexion = Database.connexion;
			st = connexion.createStatement();
			rs = st.executeQuery("SELECT * FROM clientsTerra WHERE archiver=0");

			while (rs.next()) {

				ClientsTerraBean o = new ClientsTerraBean();

				o.setId(rs.getInt("id"));
				o.setDateEnregistrement(rs.getDate("dateEnregistrement"));
				o.setDateMAJ(rs.getDate("dateMAJ"));
				o.setCivilite(rs.getInt("civilite"));
				o.setNom(rs.getString("nom"));
				o.setPrenom(rs.getString("prenom"));
				o.setTel(rs.getString("tel"));
				o.setMail(rs.getString("mail"));
				// o.setPassword(passwordStored);
				o.setAbonnement(rs.getInt("abonnement"));
				o.setStatut(rs.getInt("statut"));
				o.setArchiver(rs.getBoolean("archiver"));
				o.setCommentaire(rs.getString("commentaire"));

				list.add(o);
			}

		} catch (SQLException e) {
			e.printStackTrace();
			throw new DaoException("Impossible de communiquer avec la base de données.");
		} catch (BeanException e) {
			e.printStackTrace();
			throw new DaoException("Les données de la base sont invalides.");
		}
		return list;
	}
	
	// READ / RETRIEVE ALL
	public ArrayList<ClientsTerraBean> getAllDesinscris() throws DaoException {

		ArrayList<ClientsTerraBean> list = new ArrayList<>();
		Connection connexion = null;
		Statement st = null;
		ResultSet rs = null;

		try {

			connexion = Database.connexion;
			st = connexion.createStatement();
			rs = st.executeQuery("SELECT * FROM clientsTerra WHERE archiver=1");

			while (rs.next()) {

				ClientsTerraBean o = new ClientsTerraBean();

				o.setId(rs.getInt("id"));
				o.setDateEnregistrement(rs.getDate("dateEnregistrement"));
				o.setDateMAJ(rs.getDate("dateMAJ"));
				o.setCivilite(rs.getInt("civilite"));
				o.setNom(rs.getString("nom"));
				o.setPrenom(rs.getString("prenom"));
				o.setTel(rs.getString("tel"));
				o.setMail(rs.getString("mail"));
				// o.setPassword(passwordStored);
				o.setAbonnement(rs.getInt("abonnement"));
				o.setStatut(rs.getInt("statut"));
				o.setArchiver(rs.getBoolean("archiver"));
				o.setCommentaire(rs.getString("commentaire"));

				list.add(o);
			}

		} catch (SQLException e) {
			e.printStackTrace();
			throw new DaoException("Impossible de communiquer avec la base de données.");
		} catch (BeanException e) {
			e.printStackTrace();
			throw new DaoException("Les données de la base sont invalides.");
		}
		return list;
	}

	// GET BY ID
	public ClientsTerraBean getById(int id) throws DaoException {
		try {

			PreparedStatement ps = Database.connexion
					.prepareStatement("SELECT * FROM clientsTerra WHERE id=?");
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {

				ClientsTerraBean o = new ClientsTerraBean();

				o.setId(rs.getInt("id"));
				o.setDateEnregistrement(rs.getDate("dateEnregistrement"));
				o.setDateMAJ(rs.getDate("dateMAJ"));
				o.setCivilite(rs.getInt("civilite"));
				o.setNom(rs.getString("nom"));
				o.setPrenom(rs.getString("prenom"));
				o.setTel(rs.getString("tel"));
				o.setMail(rs.getString("mail"));

				o.setAbonnement(rs.getInt("abonnement"));
				o.setStatut(rs.getInt("statut"));
				o.setArchiver(rs.getBoolean("archiver"));
				o.setCommentaire(rs.getString("commentaire"));

				return o;

			} else {
				return null;
			}

		} catch (SQLException e) {
			e.printStackTrace();
			throw new DaoException("Impossible de communiquer avec la base de données.");
		} catch (BeanException e) {
			e.printStackTrace();
			throw new DaoException("Les données de la base sont invalides.");
		}
	}

	// READ / RETRIEVE ONE LINE BY mail
	public ClientsTerraBean getByMail(String mail) throws DaoException {

		try {

			PreparedStatement ps = Database.connexion
					.prepareStatement("SELECT id, nom, mail FROM clientsTerra WHERE mail=?");
			ps.setString(1, mail);

			ResultSet rs = ps.executeQuery();
			// System.out.println(rs);

			if (rs.next()) {

				ClientsTerraBean u = new ClientsTerraBean();
				u.setId(rs.getInt("id"));
				u.setMail(rs.getString("mail"));
				u.setNom(rs.getString("nom"));
				return u;

			} else {
				return null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DaoException("Impossible de communiquer avec la base de données.");
		} catch (BeanException e) {
			e.printStackTrace();
			throw new DaoException("Les données de la base sont invalides.");
		}
	}

	// PASSWORD VERIFICATION
	public ClientsTerraBean isLoginCorrect(String mail, String password) throws DaoException {
		try {

			PreparedStatement ps = Database.connexion
					.prepareStatement("SELECT * FROM clientsTerra WHERE mail=?"); // AND password=?
			ps.setString(1, mail);
			// ps.setString(2, passwordStored);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {

				ClientsTerraBean o = new ClientsTerraBean();

				System.out.println("password param : " + password);
				String passwordStored = rs.getString("password");
				String gp = PasswordHash.generatePassword(password);
				System.out.println("pGenerated from arg : " + gp);
				System.out.println("pStored : " + passwordStored);
				boolean isPc = PasswordHash.isPasswordCorrect(password, passwordStored);
				System.out.println("is p Correct : " + isPc);
				if (isPc) {
					o.setId(rs.getInt("id"));
					o.setDateEnregistrement(rs.getDate("dateEnregistrement"));
					o.setDateMAJ(rs.getDate("dateMAJ"));
					o.setCivilite(rs.getInt("civilite"));
					o.setNom(rs.getString("nom"));
					o.setPrenom(rs.getString("prenom"));
					o.setTel(rs.getString("tel"));
					o.setMail(rs.getString("mail"));
					o.setPassword(passwordStored);
					o.setAbonnement(rs.getInt("abonnement"));
					o.setStatut(rs.getInt("statut"));
					o.setArchiver(rs.getBoolean("archiver"));
					o.setCommentaire(rs.getString("commentaire"));

					return o;
				} else {
					return null;
				}
			} else {
				return null;
			}

		} catch (SQLException e) {
			e.printStackTrace();
			throw new DaoException("Impossible de communiquer avec la base de données.");
		} catch (BeanException e) {
			e.printStackTrace();
			throw new DaoException("Les données de la base sont invalides.");
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new DaoException("Problème d’algo sur le mdp.");
		} catch (InvalidKeySpecException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new DaoException("Problème avec le mdp.");
		}
	}

	// COUNT MONTHLY AND ANNUAL SUBSCRIPTION
	public String CountMonthlyAnnualAndTailoredSubscription() throws DaoException {

		ArrayList<Integer> countCol = new ArrayList<>();
		Connection connexion = null;
		Statement st = null;
		ResultSet rs = null;

		try {

			connexion = Database.connexion;
			st = connexion.createStatement();
			rs = st.executeQuery("SELECT COUNT(abonnement) FROM clientsTerra "
					+ "WHERE archiver=0 AND (abonnement=10 OR abonnement=11 OR abonnement=12)");
			rs.next();
			countCol.add(rs.getInt("COUNT(abonnement)"));

			rs = st.executeQuery("SELECT COUNT(abonnement) FROM clientsTerra "
					+ "WHERE archiver=0 AND (abonnement=20 OR abonnement=21 OR abonnement=22)");
			rs.next();
			countCol.add(rs.getInt("COUNT(abonnement)"));

			rs = st.executeQuery("SELECT COUNT(abonnement) FROM clientsTerra "
					+ "WHERE archiver=0 AND (abonnement=30 OR abonnement=31 OR abonnement=32)");
			rs.next();
			countCol.add(rs.getInt("COUNT(abonnement)"));

			String matSubscription = "";
			for (int i : countCol) {
				matSubscription += String.valueOf(i) + ",";
			}
			matSubscription.substring(0, matSubscription.length() - 1);

			return matSubscription;

		} catch (SQLException e) {
			e.printStackTrace();
			throw new DaoException("Impossible de communiquer avec la base de données.");
		}
	}

	// COUNT ALL NEW SUBSCRIBER FOR A TYPE OF SUBSCRIPTION
	//  PER EACH MONTH OF THE CURRENT YEAR
	// return String
	public String countAllNewSubscribersForATypeOfSubscriptionPerEachMonthOfTheCurrentYear(int subscriptionAJour,
			int subscriptionEnAttente, int subscriptionBlocked) {

//		SELECT COUNT(*) FROM `clientsTerra` 
//		WHERE YEAR (`dateMAJ`) = YEAR(NOW())
//		AND MONTH (`dateMAJ`) = MONTH(NOW())
//		AND archiver=1

		String s = "";
		String s2 = "";
		String s31 = "";
		ArrayList<String> s31Col = new ArrayList<>();
		String s30 = "";
		ArrayList<String> s30Col = new ArrayList<>();

		String year = DateManipulator.dateGetCurrentYYYY();

		try {

			for (int i = 1; i <= 12; i++) {

				// Février année bisextile ???
				if (i == 2) {

					PreparedStatement ps = Database.connexion
							.prepareStatement("SELECT COUNT(*) FROM `clientsTerra` "
									+ "WHERE `dateEnregistrement` "
									+ "BETWEEN \"" + year + "-" + i + "-01\" "
									+ "AND \"" + year + "-" + i + "-27\" "
									+ "AND (`abonnement`=? OR `abonnement`=? OR `abonnement`=?) "
									+ "AND archiver=0");
					ps.setInt(1, subscriptionAJour);
					ps.setInt(2, subscriptionEnAttente);
					ps.setInt(3, subscriptionBlocked);

					ResultSet rs = ps.executeQuery();

					rs.next();

					Integer c = rs.getInt("COUNT(*)");

					s2 += String.valueOf(c) + ",";

				}

				// Mois à 31 jours
				if (i == 1 || i == 3 || i == 5 || i == 7 || i == 8 || i == 10 || i == 12) {

					PreparedStatement ps = Database.connexion
							.prepareStatement("SELECT COUNT(*) FROM `clientsTerra` "
									+ "WHERE `dateEnregistrement` "
									+ "BETWEEN \"" + year + "-" + i + "-01\" "
									+ "AND \"" + year + "-" + i + "-31\" "
									+ "AND (`abonnement`=? OR `abonnement`=? OR `abonnement`=?) "
									+ "AND archiver=0");
					ps.setInt(1, subscriptionAJour);
					ps.setInt(2, subscriptionEnAttente);
					ps.setInt(3, subscriptionBlocked);

					ResultSet rs = ps.executeQuery();

					rs.next();

					Integer c = rs.getInt("COUNT(*)");

					s31 = String.valueOf(c) + ",";
					s31Col.add(s31);

				}

				// Mois à 30 jours
				if (i == 4 || i == 6 || i == 9 || i == 11) {

					PreparedStatement ps = Database.connexion
							.prepareStatement("SELECT COUNT(*) FROM `clientsTerra` "
									+ "WHERE `dateEnregistrement` "
									+ "BETWEEN \"" + year + "-" + i + "-01\" "
									+ "AND \"" + year + "-" + i + "-30\" "
									+ "AND (`abonnement`=? OR `abonnement`=? OR `abonnement`=?) "
									+ "AND archiver=0");
					ps.setInt(1, subscriptionAJour);
					ps.setInt(2, subscriptionEnAttente);
					ps.setInt(3, subscriptionBlocked);

					ResultSet rs = ps.executeQuery();

					rs.next();

					Integer c = rs.getInt("COUNT(*)");

					s30 = String.valueOf(c) + ",";
					s30Col.add(s30);

				}
			}
//						System.out.println("s2 : " + s2);
//						System.out.println("s31Col : " + s31Col);
//						System.out.println("s30Col : " + s30Col);
			s = s31Col.get(0) // janvier
					+ s2 // février
					+ s31Col.get(1) // mars
					+ s30Col.get(0) // avril
					+ s31Col.get(2) // mai
					+ s30Col.get(1) // juin
					+ s31Col.get(3) // juillet
					+ s31Col.get(4) // août
					+ s30Col.get(2) // septembre
					+ s31Col.get(5) // octobre
					+ s30Col.get(3) // novembre
					+ s31Col.get(6);// décembre

			s = s.substring(0, s.length() - 1); // retirer la dernière virgule
//					System.out.println("s : " + s);

			return s;

		} catch (Exception e) {

			e.printStackTrace();
			return null;
		}
	}

	// COUNT ALL UNSUBSCRIBES FOR A TYPE OF SUBSCRIPTION
	//  PER EACH MONTH OF THE CURRENT YEAR
	// return String
	public String countAllUnsubscribesForATypeOfSubscriptionPerEachMonthOfTheCurrentYear(int subscriptionAJour,
			int subscriptionEnAttente, int subscriptionBlocked) {

//		SELECT COUNT(*) FROM `clientsTerra` 
//		WHERE YEAR (`dateMAJ`) = YEAR(NOW())
//		AND MONTH (`dateMAJ`) = MONTH(NOW())
//		AND archiver=1
		
		String s = "";
		String s2 = "";
		String s31 = "";
		ArrayList<String> s31Col = new ArrayList<>();
		String s30 = "";
		ArrayList<String> s30Col = new ArrayList<>();

		String year = DateManipulator.dateGetCurrentYYYY();

		try {

			for (int i = 1; i <= 12; i++) {

				// Février année bisextile ???
				if (i == 2) {

					PreparedStatement ps = Database.connexion
							.prepareStatement("SELECT COUNT(*) FROM `clientsTerra` "
									+ "WHERE `dateMAJ` "
									+ "BETWEEN \"" + year + "-" + i + "-01\" "
									+ "AND \"" + year + "-" + i + "-27\" "
									+ "AND (`abonnement`=? OR `abonnement`=? OR `abonnement`=?) "
									+ "AND archiver=1");
					ps.setInt(1, subscriptionAJour);
					ps.setInt(2, subscriptionEnAttente);
					ps.setInt(3, subscriptionBlocked);

					ResultSet rs = ps.executeQuery();

					rs.next();

					Integer c = rs.getInt("COUNT(*)");

					s2 += String.valueOf(c) + ",";

				}

				// Mois à 31 jours
				if (i == 1 || i == 3 || i == 5 || i == 7 || i == 8 || i == 10 || i == 12) {

					PreparedStatement ps = Database.connexion
							.prepareStatement("SELECT COUNT(*) FROM `clientsTerra` "
									+ "WHERE `dateMAJ` "
									+ "BETWEEN \"" + year + "-" + i + "-01\" "
									+ "AND \"" + year + "-" + i + "-31\" "
									+ "AND (`abonnement`=? OR `abonnement`=? OR `abonnement`=?) "
									+ "AND archiver=1");
					ps.setInt(1, subscriptionAJour);
					ps.setInt(2, subscriptionEnAttente);
					ps.setInt(3, subscriptionBlocked);

					ResultSet rs = ps.executeQuery();

					rs.next();

					Integer c = rs.getInt("COUNT(*)");

					s31 = String.valueOf(c) + ",";
					s31Col.add(s31);

				}

				// Mois à 30 jours
				if (i == 4 || i == 6 || i == 9 || i == 11) {

					PreparedStatement ps = Database.connexion
							.prepareStatement("SELECT COUNT(*) FROM `clientsTerra` "
									+ "WHERE `dateMAJ` "
									+ "BETWEEN \"" + year + "-" + i + "-01\" "
									+ "AND \"" + year + "-" + i + "-30\" "
									+ "AND (`abonnement`=? OR `abonnement`=? OR `abonnement`=?) "
									+ "AND archiver=1");
					ps.setInt(1, subscriptionAJour);
					ps.setInt(2, subscriptionEnAttente);
					ps.setInt(3, subscriptionBlocked);

					ResultSet rs = ps.executeQuery();

					rs.next();

					Integer c = rs.getInt("COUNT(*)");

					s30 = String.valueOf(c) + ",";
					s30Col.add(s30);

				}
			}
//						System.out.println("s2 : " + s2);
//						System.out.println("s31Col : " + s31Col);
//						System.out.println("s30Col : " + s30Col);
			s = s31Col.get(0) // janvier
					+ s2 // février
					+ s31Col.get(1) // mars
					+ s30Col.get(0) // avril
					+ s31Col.get(2) // mai
					+ s30Col.get(1) // juin
					+ s31Col.get(3) // juillet
					+ s31Col.get(4) // août
					+ s30Col.get(2) // septembre
					+ s31Col.get(5) // octobre
					+ s30Col.get(3) // novembre
					+ s31Col.get(6);// décembre

			s = s.substring(0, s.length() - 1); // retirer la dernière virgule
//					System.out.println("s : " + s);

			return s;

		} catch (Exception e) {

			e.printStackTrace();
			return null;
		}
	}
}