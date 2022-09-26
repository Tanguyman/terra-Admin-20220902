package fr.terraAdmin.daoRestfull;

import fr.terraAdmin.beans.OffresBean;
import fr.terraAdmin.dao.Database;
import fr.terraAdmin.dao.OffresDao;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.FormParam;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;

@Path("offres")
public class OffresDaoRestfull {

	@POST
	@Path("/update")
	@Consumes("application/x-www-form-urlencoded")
	@Produces(MediaType.TEXT_PLAIN)
	public String update(
			@FormParam("id") int id, 
			@FormParam("prixAbonnement") int prix) {
		
		OffresBean o = new OffresBean();
		o.setId(id);
		o.setPrix(prix);
		System.out.println("Restfull : " + o);
		
		Database.Connect();
		OffresDao oDao = new OffresDao();
		String msg = oDao.save(o);
		System.out.println(msg);
		return msg;
		
	}
	
}
