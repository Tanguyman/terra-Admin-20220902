package fr.terraAdmin.daoRestfull;

import fr.terraAdmin.beans.LivreDOrLogosBean;
import fr.terraAdmin.dao.DaoException;
import fr.terraAdmin.dao.Database;
import fr.terraAdmin.dao.LivreDOrLogosDao;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;

@Path("/livreDOrLogos")
public class LivreDOrLogosDaoRestfull {

	@GET
	@Path("/get/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public LivreDOrLogosBean getById( @PathParam("id") int id ) throws DaoException {
	
		Database.Connect();
		LivreDOrLogosDao lDao = new LivreDOrLogosDao();
		LivreDOrLogosBean lBean = new LivreDOrLogosBean();
		
		try {
			lBean = lDao.getById(id);
			return lBean;
		} catch (DaoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new DaoException("Impossible de communiquer avec la base de données.");
		}
	}
}