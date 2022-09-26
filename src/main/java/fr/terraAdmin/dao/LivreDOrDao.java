package fr.terraAdmin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import fr.terraAdmin.beans.LivreDOrBean;

public class LivreDOrDao {

	public ArrayList<LivreDOrBean> getAll() {

		ArrayList<LivreDOrBean> list = new ArrayList<>();
		Connection connexion = null;
		Statement st = null;
		ResultSet rs = null;

		try {

			connexion = Database.connexion;
			st = connexion.createStatement();
			rs = st.executeQuery("SELECT * FROM livre_d_or");

			while (rs.next()) {

				LivreDOrBean o = new LivreDOrBean();

				o.setId(rs.getInt("id"));
				o.setNom(rs.getString("nom"));
				o.setFonction(rs.getString("fonction"));
				o.setCommentaire(rs.getString("commentaire"));
				o.setDateCommentaire(rs.getDate("dateCommentaire"));
				o.setPhoto(rs.getString("photo"));
				o.setArchiver(rs.getBoolean("archiver"));

				list.add(o);
			}

			return list;

		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}
	
	public LivreDOrBean getById( int id ) throws DaoException {

		PreparedStatement ps;
		try {
			ps = Database.connexion
					.prepareStatement("SELECT `id`, `dateCommentaire`, "
							+ "`nom`, `fonction`, `photo`, `commentaire`, "
							+ "`archiver` FROM `livre_d_or` WHERE id=?");
			ps.setInt(1, id);
			
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				
				LivreDOrBean o = new LivreDOrBean();

				o.setId(rs.getInt("id"));
				o.setDateCommentaire(rs.getDate("dateCommentaire"));
				o.setNom(rs.getString("nom"));
				o.setFonction(rs.getString("fonction"));
				o.setPhoto(rs.getString("photo"));
				o.setCommentaire(rs.getString("commentaire"));
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
