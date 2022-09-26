package fr.terraAdmin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import fr.terraAdmin.beans.OffresBean;

public class OffresDao {

	// CREATE if !exist else UPDATE
	public String save(OffresBean o) {
	
		System.out.println(o.getId() + " " + o.getPrix());
		Connection connexion = null;
		PreparedStatement ps = null;
		String msg = "";

		if (o.getId() < 1 || o.getId() > 2) {

			msg = "<div id=\"alertSuccess\" class=\"alert alert-danger text-center\" "
					+ "role=\"alert\">Cet abonnement n’existe pas !</div>";
			return msg;

		} else {

			try {
				
				Database.Connect();
				connexion = Database.connexion;

				ps = Database.connexion
						.prepareStatement("UPDATE `offres` "
								+ "SET `prix`=? "
								+ "WHERE id=?");
				ps.setInt(1, o.getPrix());
				ps.setInt(2, o.getId());
				
				ps.executeUpdate();
				connexion.commit();
				
				System.out.println("SAVED OK");
				msg = "<div id=\"alertSuccess\" class=\"alert alert-success text-center\" "
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
				msg = "<div id=\"alertSuccess\" class=\"alert alert-danger text-center\" "
						+ "role=\"alert\">Impossible de communiquer avec la base de données.</div>";
				return msg;
			}
		}
	}

	public ArrayList<OffresBean> getAll() {

		ArrayList<OffresBean> list = new ArrayList<>();
		Connection connexion = null;
		Statement st = null;
		ResultSet rs = null;

		try {

			connexion = Database.connexion;
			st = connexion.createStatement();
			rs = st.executeQuery("SELECT `id`, `titreAbonnement`, "
					+ "`description`, `prix`, `imageURL`, `archiver` "
					+ "FROM `offres`");

			while (rs.next()) {

				OffresBean o = new OffresBean();

				o.setId(rs.getInt("id"));
				o.setTitreAbonnement(rs.getString("titreAbonnement"));
				o.setDescription(rs.getString("description"));
				o.setPrix(rs.getInt("prix"));
				o.setImageURL(rs.getString("imageURL"));
				o.setArchiver(rs.getBoolean("archiver"));

				list.add(o);
			}

			return list;

		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}
}
