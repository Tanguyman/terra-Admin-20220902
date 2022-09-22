package fr.terraAdmin.dao;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import fr.terraAdmin.beans.AdminBean;
import fr.terraAdmin.beans.BeanException;
import fr.terraAdmin.tools.PasswordHash;

public class AdminDao {

	// CREATE if exist UPDATE
	public void save(AdminBean o) throws DaoException {

		Connection connexion = null;
		PreparedStatement ps = null;

		try {
			if (o.getId() != 0) {

//				Database.Connect();
				connexion = Database.connexion;
				ps = Database.connexion
						.prepareStatement("UPDATE `admin` SET `civilite`=?,`nom`=?,`prenom`=?,"
								+ "`tel`=?,`mail`=?,`password`=?,`privileges`=?,`archiver`=? "
								+ "WHERE `id`=?");

				ps.setInt(1, o.getCivilite());
				ps.setString(2, o.getNom());
				ps.setString(3, o.getPrenom());
				ps.setString(4, o.getTel());
				ps.setString(5, o.getMail());
				String pHash = PasswordHash.generatePassword(o.getPassword());
				System.out.println(pHash);
				ps.setString(6, pHash);
				ps.setInt(7, o.getPrivileges());
				ps.setBoolean(8, o.isArchiver());

				ps.setInt(9, o.getId());

				ps.executeUpdate();
				connexion.commit();

			} else {

				connexion = Database.connexion;
				ps = Database.connexion
						.prepareStatement("INSERT INTO "
								+ "`admin`(`id`, `civilite`, `nom`, `prenom`, `tel`, `mail`, "
								+ "`password`, `privileges`, `archiver`) "
								+ "VALUES(?,?,?,?,?,?,?,?,?)");

				ps.setInt(1, o.getCivilite());
				ps.setString(2, o.getNom());
				ps.setString(3, o.getPrenom());
				ps.setString(4, o.getTel());
				ps.setString(5, o.getMail());
				String pHash = PasswordHash.generatePassword(o.getPassword());
				System.out.println(pHash);
				ps.setString(6, pHash);
				ps.setInt(7, o.getPrivileges());
				ps.setBoolean(8, o.isArchiver());

				ps.executeUpdate();
				connexion.commit();
			}

			System.out.println("SAVED OK");

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
	}

	// READ : PASSWORD VERIFICATION
	public AdminBean isLoginCorrect(String mail, String password) throws DaoException {
		
		try {
			
			PreparedStatement ps = Database.connexion
					.prepareStatement("SELECT * FROM Admin WHERE mail=?");
			ps.setString(1, mail);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {

				String passwordStored = rs.getString("password");
				boolean isPc = PasswordHash.isPasswordCorrect(password, passwordStored);

//				System.out.println("password du formulaire : " + password);
//				System.out.println("hashage du password du formulaire : "
//						+ PasswordHash.generatePassword(password));
//				System.out.println("password stocké en BDD : " + passwordStored);
//				System.out.println("is p Correct : " + isPc);

				if (isPc) {
					AdminBean o = new AdminBean();

					o.setId(rs.getInt("id"));
					o.setCivilite(rs.getInt("civilite"));
					o.setNom(rs.getString("nom"));
					o.setPrenom(rs.getString("prenom"));
					o.setTel(rs.getString("tel"));
					o.setMail(rs.getString("mail"));
					o.setPassword(password);
					o.setPrivileges(rs.getInt("privileges"));
					o.setArchiver(rs.getBoolean("archiver"));

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

	// READ : IS MAIL IN DATABASE
	public Boolean isMailInDatabase(String mail) throws DaoException {
		try {
			PreparedStatement ps = Database.connexion
					.prepareStatement("SELECT * FROM Admin WHERE mail=?");
			ps.setString(1, mail);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return true;
			} else {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DaoException("Impossible de communiquer avec la base de données.");
		}
	}

	// UPDATE : block account
	public void blockAccount(String mail) throws DaoException {

		Connection connexion = null;
		PreparedStatement ps = null;

		try {
			connexion = Database.connexion;

			ps = Database.connexion.prepareStatement("UPDATE `admin` SET `archiver`=true "
					+ "WHERE `mail`=?");
			ps.setString(1, mail);

			ps.executeUpdate();
			connexion.commit();
			System.out.println("SAVED OK");

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SAVED NO");
			try {
				if (connexion != null) {
					connexion.rollback();
				}
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			throw new DaoException("Impossible de communiquer avec la base de données.");
		}
	}
}