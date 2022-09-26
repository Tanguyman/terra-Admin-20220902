package fr.terraAdmin.daoRestfull;

import fr.terraAdmin.beans.CoordonneesTerraBean;
import fr.terraAdmin.dao.CoordonneesTerraDao;
import fr.terraAdmin.dao.Database;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.FormParam;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;

@Path("/coordonneesTerra")
public class CoordonneesTerraDaoRestfull {

	@POST
	@Path("/update")
	@Consumes("application/x-www-form-urlencoded")
	@Produces(MediaType.TEXT_PLAIN)
	public String update(
			@FormParam("id") int id, @FormParam("nom") String nom,
			@FormParam("adresse") String adresse,
			@FormParam("tel") String tel, @FormParam("mail") String mail,
			@FormParam("logoURL") String logoURL,
			@FormParam("archiver") boolean archiver) {

		id = 1;
		nom = nom.substring(1, nom.length() - 1);
		adresse = adresse.substring(1, adresse.length() - 1);
		tel = tel.substring(1, tel.length() - 1);
		mail = mail.substring(1, mail.length() - 1);
		logoURL = logoURL.substring(1, logoURL.length() - 1);

		CoordonneesTerraBean o = new CoordonneesTerraBean();
		o.setId(id);
		o.setNom(nom);
		o.setAdresse(adresse);
		o.setTel(tel);
		o.setMail(mail);
		o.setLogoURL(logoURL);
		System.out.println("Restfull : " + o);

		Database.Connect();
		CoordonneesTerraDao ctDao = new CoordonneesTerraDao();
		String msg;

		msg = ctDao.save(o);
		System.out.println(msg);
		return msg;

	}
}