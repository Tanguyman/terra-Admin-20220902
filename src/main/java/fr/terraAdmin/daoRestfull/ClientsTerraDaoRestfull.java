package fr.terraAdmin.daoRestfull;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import fr.terraAdmin.beans.BeanException;
import fr.terraAdmin.beans.ClientsTerraBean;
import fr.terraAdmin.dao.ClientsTerraDao;
import fr.terraAdmin.dao.DaoException;
import fr.terraAdmin.dao.Database;
import fr.terraAdmin.tools.DateManipulator;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.FormParam;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;


@Path( "/client" )
public class ClientsTerraDaoRestfull {

	/*
	 *  GET BY ID
	 */
	@GET
	@Path( "/get/{id}" )
	@Produces( MediaType.APPLICATION_JSON )
	public ClientsTerraBean getById( @PathParam( "id" ) int id) throws DaoException {

		Database.Connect();
		ClientsTerraDao ctDao = new ClientsTerraDao();
		ClientsTerraBean ctBean;
		try {
			ctBean = ctDao.getById(id);
			return ctBean;
		} catch (DaoException e) {
			e.printStackTrace();
			throw new DaoException("Impossible de communiquer avec la base de données.");
		}
	}
	
	/*
	 *  UPDATE CLIENT V2
	 */
	@POST
	@Path( "/update" )
	@Consumes("application/x-www-form-urlencoded")
	@Produces( MediaType.TEXT_PLAIN )
	public String update( 
			@FormParam("id") int id, @FormParam("civilite") int civilite, 
			@FormParam("nom") String nom, @FormParam("prenom") String prenom,
			@FormParam("tel") String tel, @FormParam("mail") String mail,
			@FormParam("abonnement") int abo, @FormParam("paiement") int paiement,
			@FormParam("secu") int secu, @FormParam("commentaire") String commentaire, 
			@FormParam("archiver") boolean archiver
		) throws DaoException {

		
		int aboPaiement = abo + paiement;
		nom = nom.substring(1, nom.length() - 1 );
		prenom = prenom.substring(1, prenom.length() - 1 );
		tel = tel.substring(1, tel.length() - 1 );
		mail = mail.substring(1, mail.length() - 1 );
		commentaire = commentaire.substring(1, commentaire.length() - 1 );
		System.out.println( id + " " + civilite + " " + nom + " " + prenom );
		System.out.println( tel + " " + mail + " " + abo );
		System.out.println( paiement + " " + secu + " " + commentaire );
		System.out.println( "aboPaiement : " + aboPaiement );
		System.out.println( "archiver : " + archiver );
		
		
		Connection connexion = null;
		PreparedStatement ps = null;
		try {
			
			Database.Connect();
			connexion = Database.connexion;
			
			ClientsTerraDao ctDao = new ClientsTerraDao();
			ClientsTerraBean ctBean = new ClientsTerraBean();
			
			ctBean.setId(id);
			ctBean.setDateMAJ(DateManipulator.dateInSql());
			ctBean.setCivilite(civilite);
			ctBean.setNom(nom);
			ctBean.setPrenom(prenom);
			ctBean.setTel(tel);
			ctBean.setMail(mail);
			ctBean.setAbonnement(aboPaiement);
			ctBean.setStatut(secu);
			ctBean.setCommentaire(commentaire);
			ctBean.setArchiver(archiver);
			
			if (id != 0) {

				if ( !ctDao.getById(id).getMail().equals(mail) ) {
					
					if ( ctDao.getByMail(mail) != null ) {
						
						String msg = "<div id=\"alertSuccess\" class=\"alert alert-danger text-center\" "
								+ "role=\"alert\">Cette email est déjà pris !</div>";
						return msg;
						
					} else {
						
						ps = Database.connexion
								.prepareStatement("UPDATE clientsTerra SET dateMAJ=?, "
										+ "civilite=?, nom=?, prenom=?, tel=?, mail=?, "
										+ "abonnement=?, statut=?, commentaire=?, archiver=? "
										+ "WHERE id=?");
						
						ps.setDate(1, DateManipulator.dateInSql());
						ps.setInt(2, civilite);
						ps.setString(3, nom);
						ps.setString(4, prenom);
						ps.setString(5, tel);
						ps.setString(6, mail);
						ps.setInt(7, aboPaiement);
						ps.setInt(8, secu);
						ps.setString(9, commentaire);
						ps.setBoolean(10, archiver);
		
						ps.setInt(11, id);
		
						ps.executeUpdate();
						connexion.commit();
					}
				
				} else {
					
					ps = Database.connexion
							.prepareStatement("UPDATE clientsTerra SET dateMAJ=?, "
									+ "civilite=?, nom=?, prenom=?, tel=?, mail=?, "
									+ "abonnement=?, statut=?, commentaire=?, archiver=? "
									+ "WHERE id=?");
					
					ps.setDate(1, DateManipulator.dateInSql());
					ps.setInt(2, civilite);
					ps.setString(3, nom);
					ps.setString(4, prenom);
					ps.setString(5, tel);
					ps.setString(6, mail);
					ps.setInt(7, aboPaiement);
					ps.setInt(8, secu);
					ps.setString(9, commentaire);
					ps.setBoolean(10, archiver);
	
					ps.setInt(11, id);
	
					ps.executeUpdate();
					connexion.commit();
				}
			} else {
				
				if ( ctDao.getByMail(mail) != null ) {
					
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
					
					ps.setDate(1, DateManipulator.dateInSql());
					ps.setInt(2, civilite);
					ps.setString(3, nom);
					ps.setString(4, prenom);
					ps.setString(5, tel);
					ps.setString(6, mail);
					ps.setInt(7, aboPaiement);
					ps.setInt(8, secu);
					ps.setBoolean(9, archiver);
					ps.setString(10, commentaire);
					ps.setDate(11, DateManipulator.dateInSql());
					
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
		} catch (BeanException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			String msg = "<div id=\"alertSuccess\" class=\"alert alert-danger text-center\" "
					+ "role=\"alert\">" + e1.getMessage() + "</div>";
			return msg;
		}	
	}
	/*
	 *  UPDATE CLIENT V2
	 */
//	@POST
//	@Path( "/update" )
//	@Consumes("application/x-www-form-urlencoded")
//	public void post(MultivaluedMap<String, String> formParams) { // fonctionne
//		for ( List<String> ctb : formParams.values() ) {
//			System.out.println( ctb );	
//		}
//	}
//	@POST
//	@Path( "/update" )
//	@Consumes( MediaType.APPLICATION_JSON)
//	@Produces( MediaType.TEXT_PLAIN )
//	@Produces( MediaType.APPLICATION_JSON )
//	public void save(ClientsTerraBean o) throws DaoException {
//	public void save(String msg) { // fonctionne
//				System.out.println( msg);
//	}
	
}
