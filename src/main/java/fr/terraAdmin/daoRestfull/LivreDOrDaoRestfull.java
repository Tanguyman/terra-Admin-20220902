package fr.terraAdmin.daoRestfull;

import fr.terraAdmin.beans.LivreDOrBean;
import fr.terraAdmin.dao.DaoException;
import fr.terraAdmin.dao.Database;
import fr.terraAdmin.dao.LivreDOrDao;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;

@Path("/livreDOr")
public class LivreDOrDaoRestfull {

	@GET
	@Path("/get/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public LivreDOrBean getById(@PathParam("id") int id) throws DaoException {

		Database.Connect();
		LivreDOrDao lDao = new LivreDOrDao();
		LivreDOrBean lBean = new LivreDOrBean();

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
