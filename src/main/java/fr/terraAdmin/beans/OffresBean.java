package fr.terraAdmin.beans;

public class OffresBean {

	private int id;
	private String titreAbonnement;
	private String description;
	private int prix;
	private String imageURL;
	private boolean archiver;

	public OffresBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OffresBean(int id, String titreAbonnement, String description, int prix, String imageURL,
			boolean archiver) {
		super();
		this.id = id;
		this.titreAbonnement = titreAbonnement;
		this.description = description;
		this.prix = prix;
		this.imageURL = imageURL;
		this.archiver = archiver;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitreAbonnement() {
		return titreAbonnement;
	}

	public void setTitreAbonnement(String titreAbonnement) {
		this.titreAbonnement = titreAbonnement;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getPrix() {
		return prix;
	}

	public void setPrix(int prix) {
		this.prix = prix;
	}

	public String getImageURL() {
		return imageURL;
	}

	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}

	public boolean isArchiver() {
		return archiver;
	}

	public void setArchiver(boolean archiver) {
		this.archiver = archiver;
	}

	@Override
	public String toString() {
		return "OffreDaoBean [id=" + id + ", titreAbonnement=" + titreAbonnement + ", description=" + description
				+ ", prix=" + prix + ", imageURL=" + imageURL + ", archiver=" + archiver + "]";
	}

}