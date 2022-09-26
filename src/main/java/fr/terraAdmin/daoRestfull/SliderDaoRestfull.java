package fr.terraAdmin.daoRestfull;

import fr.terraAdmin.beans.SliderBean;
import fr.terraAdmin.dao.DaoException;
import fr.terraAdmin.dao.Database;
import fr.terraAdmin.dao.SliderDao;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;

@Path( "/slider" )
public class SliderDaoRestfull {

	/*
	 *  GET BY ID
	 */
	@GET
	@Path( "/get/{id}" )
	@Produces( MediaType.APPLICATION_JSON )
	public SliderBean getById( @PathParam( "id" ) int id ) throws DaoException {
		
		Database.Connect();
		SliderDao sDao = new SliderDao();
		SliderBean sBean = new SliderBean();
		
		try {
			sBean = sDao.getById(id);
			return sBean;
		} catch (DaoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new DaoException("Impossible de communiquer avec la base de données.");
		}
		
	}
}
