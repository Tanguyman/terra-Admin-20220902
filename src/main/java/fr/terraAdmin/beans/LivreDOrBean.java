package fr.terraAdmin.beans;

import java.sql.Date;

public class LivreDOrBean {

	private int id;
	private Date dateCommentaire;
	private String nom;
	private String fonction;
	private String photo;
	private String commentaire;
	private boolean archiver;

	public LivreDOrBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public LivreDOrBean(int id, Date dateCommentaire, String nom, String fonction, 
			String photo, String commentaire, boolean archiver) {
		super();
		this.id = id;
		this.dateCommentaire = dateCommentaire;
		this.nom = nom;
		this.fonction = fonction;
		this.photo = photo;
		this.commentaire = commentaire;
		this.archiver = archiver;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getDateCommentaire() {
		return dateCommentaire;
	}

	public void setDateCommentaire(Date dateCommentaire) {
		this.dateCommentaire = dateCommentaire;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getFonction() {
		return fonction;
	}

	public void setFonction(String fonction) {
		this.fonction = fonction;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getCommentaire() {
		return commentaire;
	}

	public void setCommentaire(String commentaire) {
		this.commentaire = commentaire;
	}

	public boolean isArchiver() {
		return archiver;
	}

	public void setArchiver(boolean archiver) {
		this.archiver = archiver;
	}

	@Override
	public String toString() {
		return "LivreDOrBean [id=" + id + ", dateCommentaire=" + dateCommentaire + ", nom=" + nom + ", fonction="
				+ fonction + ", photo=" + photo + ", commentaire=" + commentaire + ", archiver=" + archiver + "]";
	}

}
