package fr.terraAdmin.beans;

import fr.terraAdmin.tools.RegexValidator;

public class AdminBean {

	private int id;
	private int civilite;
	private String nom;
	private String prenom;
	private String tel;
	private String mail;
	private String password;
	private int privileges;
	private boolean archiver;

	public AdminBean() {
		super();
	}

	public AdminBean(int id, int civilite, String nom, String prenom, String tel, String mail, String password,
			int privileges, boolean archiver) throws BeanException {
		super();
		this.setId(id);
		this.setCivilite(civilite);
		this.setNom(nom);
		this.setPrenom(prenom);
		this.setTel(tel);
		this.setMail(mail);
		this.setPassword(password);
		this.setPrivileges(privileges);
		this.setArchiver(archiver);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCivilite() {
		return civilite;
	}

	public void setCivilite(int civilite) {
		this.civilite = civilite;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) throws BeanException {
		if (!RegexValidator.nameValidator(nom) || nom.length() > 60) {
			throw new BeanException("Votre <b>nom de famille</b> :<br>"
					+ "- ne peut pas être vide.<br>"
					+ "- ne peut pas dépasser 60 caractères.<br>"
					+ "- doit commencer et se terminer par une lettre.<br>"
					+ "- ne doit pas contenir de chiffres ou de caractères spéciaux.<br>"
					+ "- peut être composé de 3 noms au maximum "
					+ "que vous pouvez séparer par un espace ou un tiret (-).<br>");
		} else {
			this.nom = nom;
		}
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) throws BeanException {
		if (!RegexValidator.nameValidator(prenom) || nom.length() > 60) {
			throw new BeanException("Votre <b>prénom</b> :<br>"
					+ "- ne peut pas être vide.<br>"
					+ "- ne peut pas dépasser 60 caractères.<br>"
					+ "- doit commencer et se terminer par une lettre.<br>"
					+ "- ne doit pas contenir de chiffres ou de caractères spéciaux.<br>"
					+ "- peut être composé de 3 noms au maximum "
					+ "que vous pouvez séparer par un espace ou un tiret (-).<br>");
		} else {
			this.prenom = prenom;
		}
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) throws BeanException {
		if (!RegexValidator.phoneNumberFrenchValidator(tel)) {
			throw new BeanException("Votre <b>numéro de téléphone</b> n’est pas au format français.<br>"
					+ "Il doit comprendre 10 chiffres et commencer par 0 "
					+ "suivi d’un chiffre entre 1 et 9.");
		} else {
			this.tel = tel;
		}
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) throws BeanException {
		if (!RegexValidator.emailValidator(mail)) {
			throw new BeanException("Votre <b>email</b> n’est pas au bon format.");
		} else {
			this.mail = mail;
		}
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) throws BeanException {
		if (!RegexValidator.passwordValidator(password)) {
			throw new BeanException("Politique de sécurité concernant les <b>mots de passe</b> :<br>"
					+ "- au moins un chiffre.<br>"
					+ "- au moins une lettre minuscule.<br>"
					+ "- au moins une lettre majuscule.<br>"
					+ "- au moins un caractère spécial @ # $ % ^ & + = <br>"
					+ "- minimum 8 caractères. <br>"
					+ "- aucun espace.");
		} else {
			this.password = password;
		}
	}

	public int getPrivileges() {
		return privileges;
	}

	public void setPrivileges(int privileges) {
		this.privileges = privileges;
	}

	public boolean isArchiver() {
		return archiver;
	}

	public void setArchiver(boolean archiver) {
		this.archiver = archiver;
	}

	@Override
	public String toString() {
		return "AdminBean [id=" + id + ", civilite=" + civilite + ", nom=" + nom + ", prenom=" + prenom + ", tel=" + tel
				+ ", mail=" + mail + ", password=" + password + ", privileges=" + privileges + ", archiver=" + archiver
				+ "]";
	}
}