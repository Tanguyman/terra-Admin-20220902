package fr.terraAdmin.beans;

public class CoordonneesTerraBean {

	private int id;
	private String nom;
	private String adresse;
	private String tel;
	private String mail;
	private String logoURL;
	private boolean archiver;

	public CoordonneesTerraBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CoordonneesTerraBean(int id, String nom, String adresse,
			String tel, String mail, String logoURL, boolean archiver) {
		super();
		this.id = id;
		this.nom = nom;
		this.adresse = adresse;
		this.tel = tel;
		this.mail = mail;
		this.logoURL = logoURL;
		this.archiver = archiver;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getLogoURL() {
		return logoURL;
	}

	public void setLogoURL(String logoURL) {
		this.logoURL = logoURL;
	}

	public boolean isArchiver() {
		return archiver;
	}

	public void setArchiver(boolean archiver) {
		this.archiver = archiver;
	}

	@Override
	public String toString() {
		return "CoordonneesTerraBean [id=" + id + ", nom=" + nom + ", adresse=" + adresse + ", tel=" + tel + ", mail="
				+ mail + ", logoURL=" + logoURL + ", archiver=" + archiver + "]";
	}

}
