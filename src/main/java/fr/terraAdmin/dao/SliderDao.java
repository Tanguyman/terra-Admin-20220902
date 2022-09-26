package fr.terraAdmin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import fr.terraAdmin.beans.SliderBean;

public class SliderDao {

	public void save(SliderBean o) {
		try {

			if (o.getId() != 0) {

				PreparedStatement ps = Database.connexion
						.prepareStatement("UPDATE `slider` "
								+ "SET `titre`=?,`description`=?,"
								+ "`imageURL`=?,`titreBouton`=?,"
								+ "`urlBouton`=?,`archiver`=? "
								+ "WHERE id=?");

				ps.setString(1, o.getTitre());
				ps.setString(2, o.getDescription());
				ps.setString(3, o.getImageURL());
				ps.setString(4, o.getTitreBouton());
				ps.setString(5, o.getUrlBouton());
				ps.setBoolean(6, o.isArchiver());

				ps.setInt(7, o.getId());

				ps.executeUpdate();

			} else {

				PreparedStatement ps = Database.connexion
						.prepareStatement("INSERT INTO `slider`"
								+ "(`titre`, `description`, `imageURL`, "
								+ "`titreBouton`, `urlBouton`, `archiver`) "
								+ "VALUES (?,?,?,?,?,?,?)");

				ps.setString(1, o.getTitre());
				ps.setString(2, o.getDescription());
				ps.setString(3, o.getImageURL());
				ps.setString(4, o.getTitreBouton());
				ps.setString(5, o.getUrlBouton());
				ps.setBoolean(6, o.isArchiver());

				ps.executeUpdate();
			}

			System.out.println("SAVED OK");

		} catch (Exception ex) {

			ex.printStackTrace();
			System.out.println("SAVED NO");

		}
	}

	public ArrayList<SliderBean> getAll() {

		ArrayList<SliderBean> list = new ArrayList<>();
		Connection connexion = null;
		Statement st = null;
		ResultSet rs = null;

		try {

			connexion = Database.connexion;
			st = connexion.createStatement();
			rs = st.executeQuery("SELECT * FROM slider");

			while (rs.next()) {

				SliderBean o = new SliderBean();

				o.setId(rs.getInt("id"));
				o.setTitre(rs.getString("titre"));
				o.setDescription(rs.getString("description"));
				o.setImageURL(rs.getString("imageURL"));
				o.setTitreBouton(rs.getString("titreBouton"));
				o.setUrlBouton(rs.getString("urlBouton"));
				o.setArchiver(rs.getBoolean("archiver"));

				list.add(o);
			}

			return list;

		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}
	
	public SliderBean getById( int id ) throws DaoException {

		PreparedStatement ps;
		try {
			ps = Database.connexion
					.prepareStatement("SELECT * FROM slider WHERE id=?");
			ps.setInt(1, id);
			
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				
				SliderBean o = new SliderBean();

				o.setId(rs.getInt("id"));
				o.setTitre(rs.getString("titre"));
				o.setDescription(rs.getString("description"));
				o.setImageURL(rs.getString("imageURL"));
				o.setTitreBouton(rs.getString("titreBouton"));
				o.setUrlBouton(rs.getString("urlBouton"));
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
