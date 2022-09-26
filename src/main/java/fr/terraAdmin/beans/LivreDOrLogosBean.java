package fr.terraAdmin.beans;

public class LivreDOrLogosBean {

	private int id;
	private String societe;
	private String url;
	private boolean archiver;

	public LivreDOrLogosBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public LivreDOrLogosBean(int id, String societe, String url, boolean archiver) {
		super();
		this.id = id;
		this.societe = societe;
		this.url = url;
		this.archiver = archiver;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSociete() {
		return societe;
	}

	public void setSociete(String societe) {
		this.societe = societe;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public boolean isArchiver() {
		return archiver;
	}

	public void setArchiver(boolean archiver) {
		this.archiver = archiver;
	}

	@Override
	public String toString() {
		return "LivreDOrLogosBean [id=" + id + ", societe=" + societe + ", url=" + url + ", archiver=" + archiver + "]";
	}

}
