package fr.terraAdmin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import fr.terraAdmin.beans.LivreDOrLogosBean;

public class LivreDOrLogosDao {

	public ArrayList<LivreDOrLogosBean> getAll() {

		ArrayList<LivreDOrLogosBean> list = new ArrayList<>();
		Connection connexion = null;
		Statement st = null;
		ResultSet rs = null;

		try {

			connexion = Database.connexion;
			st = connexion.createStatement();
			rs = st.executeQuery("SELECT `id`, `societe`, `url`, "
					+ "`archiver` FROM `livre_d_or_logos`");

			while (rs.next()) {

				LivreDOrLogosBean o = new LivreDOrLogosBean();

				o.setId(rs.getInt("id"));
				o.setSociete(rs.getString("societe"));
				o.setUrl(rs.getString("url"));
				o.setArchiver(rs.getBoolean("archiver"));

				list.add(o);
			}

			return list;

		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}
	
	public LivreDOrLogosBean getById( int id ) throws DaoException {

		PreparedStatement ps;
		try {
			ps = Database.connexion
					.prepareStatement("SELECT `id`, `societe`, `url`, "
							+ "`archiver` FROM `livre_d_or_logos`"
							+ "WHERE id=?");
			ps.setInt(1, id);
			
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				
				LivreDOrLogosBean o = new LivreDOrLogosBean();

				o.setId(rs.getInt("id"));
				o.setSociete(rs.getString("societe"));
				o.setUrl(rs.getString("url"));
				o.setArchiver(rs.getBoolean("archiver"));

				return o;
			} else {
				return null;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new DaoException("Impossible de communiquer avec la base de données.");
		}
	}
}
