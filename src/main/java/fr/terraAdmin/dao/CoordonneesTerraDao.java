package fr.terraAdmin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import fr.terraAdmin.beans.CoordonneesTerraBean;

public class CoordonneesTerraDao {

	public String save(CoordonneesTerraBean o) {
		System.out.println("DAO : " + o);
		String msg = "";
		Connection connexion = null;
		PreparedStatement ps = null;
		
		try {

			Database.Connect();
			connexion = Database.connexion;
			
			if (o.getId() != 0) {

				ps = connexion.prepareStatement(
						"UPDATE `coordonneesTerra` "
						+ "SET `nom`=?,`adresse`=?,`tel`=?,"
							+ "`mail`=?,`logoURL`=?,"
							+ "`archiver`=? "
						+ "WHERE id=?");
				ps.setString(1, o.getNom());
				ps.setString(2, o.getAdresse());
				ps.setString(3, o.getTel());
				ps.setString(4, o.getMail());
				ps.setString(5, "img/logosTerra/Terra-Logo_1.png"); //o.getLogoURL()
				ps.setBoolean(6, o.isArchiver());

				ps.setInt(7, o.getId());
				ps.executeUpdate();
				connexion.commit();

			} else {

				ps = connexion.prepareStatement(
						"INSERT INTO `coordonneesTerra`(`id`, `nom`, "
							+ "`adresse`, `tel`, `mail`, "
							+ "`logoURL`, `archiver`) "
						+ "VALUES (?,?,?,?,?,?,?)");
				ps.setString(1, o.getNom());
				ps.setString(2, o.getAdresse());
				ps.setString(3, o.getTel());
				ps.setString(4, o.getMail());
				ps.setString(5, o.getLogoURL());
				ps.setBoolean(6, o.isArchiver());

				ps.executeUpdate();
				connexion.commit();

			}
			System.out.println("SAVED OK");
			msg = "<div id=\"alertSuccess\" class=\"alert alert-success text-center\" "
					+ "role=\"alert\">Les coordonnées ont bien été mises à jour</div>";
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

	public CoordonneesTerraBean getById(int id) throws DaoException {
		try {

			PreparedStatement ps = Database.connexion
					.prepareStatement("SELECT * FROM coordonneesTerra WHERE id=?");
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();

			CoordonneesTerraBean o = new CoordonneesTerraBean();

			rs.next();

			o.setId(rs.getInt("id"));
			o.setNom(rs.getString("nom"));
			o.setAdresse(rs.getString("adresse"));
			o.setTel(rs.getString("tel"));
			o.setMail(rs.getString("mail"));
			o.setLogoURL(rs.getString("logoURL"));
			o.setArchiver(rs.getBoolean("archiver"));

			return o;

		} catch (SQLException e) {
			e.printStackTrace();
			throw new DaoException("Impossible de communiquer avec la base de données.");
		}
	}
}
