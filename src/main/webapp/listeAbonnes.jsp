<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="fr.terraAdmin.beans.ClientsTerraBean"%>
<%
ArrayList<ClientsTerraBean> ctBeanCol = (ArrayList) request.getAttribute("ctBeanCol");
%>
<!DOCTYPE html>
<html lang="Fr">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <title>Liste des abonnés</title>
    <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico"/>
    <link href="assets/css/loader.css" rel="stylesheet" type="text/css" />
    <script src="assets/js/loader.js"></script>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Quicksand:400,500,600,700&display=swap" rel="stylesheet">
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/plugins.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->
    <!--  BEGIN CUSTOM STYLE FILE  -->
    <link href="assets/css/pages/contact_us.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="assets/css/forms/theme-checkbox-radio.css">
    <link href="assets/css/scrollspyNav.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="plugins/bootstrap-select/bootstrap-select.min.css">
    <!--  END CUSTOM STYLE FILE  -->
    <!-- BEGIN PAGE LEVEL STYLES -->
    <link rel="stylesheet" type="text/css" href="plugins/table/datatable/datatables.css">
    <link rel="stylesheet" type="text/css" href="plugins/table/datatable/dt-global_style.css">
    <link rel="stylesheet" type="text/css" href="plugins/table/datatable/custom_dt_miscellaneous.css">
    <link rel="stylesheet" type="text/css" href="assets/css/forms/theme-checkbox-radio.css">
    <!-- END PAGE LEVEL STYLES -->
    
    <!-- CSS -->
    <style>
    .bootstrap-select:not([class*=col-]):not([class*=form-control]):not(.input-group-btn) {
    	width : 100%
    }
    </style>
    
</head>
<body class="sidebar-noneoverflow">

    <!-- BEGIN LOADER NAVBAR -->
	<jsp:include page="/Header" />
    <!--  END LOADER NAVBAR -->

    <!--  BEGIN MAIN CONTAINER  -->
    <div class="main-container" id="container">

        <div class="overlay"></div>
        <div class="search-overlay"></div>

        <!--  BEGIN CONTENT AREA  -->
        <div id="content" class="main-content">
            <div class="layout-px-spacing">

                <div class="page-header">
                    <nav class="breadcrumb-one" aria-label="breadcrumb">
                        <div class="title">
                            <h3>Liste des abonnés</h3>
                        </div>
                        <!-- <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0);">Tables</a></li>
                            <li class="breadcrumb-item"><a href="javascript:void(0);">DataTables</a></li>
                            <li class="breadcrumb-item active" aria-current="page"><a href="javascript:void(0);">Miscellaneous</a></li>
                        </ol> -->
                    </nav>
    
                    <div class="toggle-switch">
                        <label class="switch s-icons s-outline  s-outline-secondary">
                            <input type="checkbox" checked="" class="theme-shifter">
                            <span class="slider round">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-sun"><circle cx="12" cy="12" r="5"></circle><line x1="12" y1="1" x2="12" y2="3"></line><line x1="12" y1="21" x2="12" y2="23"></line><line x1="4.22" y1="4.22" x2="5.64" y2="5.64"></line><line x1="18.36" y1="18.36" x2="19.78" y2="19.78"></line><line x1="1" y1="12" x2="3" y2="12"></line><line x1="21" y1="12" x2="23" y2="12"></line><line x1="4.22" y1="19.78" x2="5.64" y2="18.36"></line><line x1="18.36" y1="5.64" x2="19.78" y2="4.22"></line></svg>
    
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-moon"><path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"></path></svg>
                            </span>
                        </label>
                    </div>
    
                </div>
                
                <div id="alertAjax" class="form-group"></div>	

				<div class="row layout-spacing">
                    <div class="col text-center">
                    	<button id="virginModal" type="button" class="btn btn-primary" onclick="showVirginModal()">Ajouter un abonné</button>
                    </div>
				</div>
                <!-- <div class="seperator-header layout-top-spacing">
                    <h4 class="">Show/ Hide Columns</h4>
                </div> -->
                
                <div class="row layout-spacing">
                    <div class="col-lg-12">
                        <div class="statbox widget box box-shadow">
                            <div class="widget-content widget-content-area">
                            
								<!-- <div class="table-form">
	                                <div class="form-group row mr-3">
	                                    <label for="min" class="col-sm-5 col-form-label col-form-label-sm">Minimum age:</label>
	                                    <div class="col-sm-7">
	                                        <input type="text" class="form-control form-control-sm" name="min" id="min" placeholder="">
	                                    </div>
	                                </div>
	
	                                <div class="form-group row">
	                                    <label for="max" class="col-sm-5 col-form-label col-form-label-sm">Maximum age:</label>
	                                    <div class="col-sm-7">
	                                        <input type="text" class="form-control form-control-sm" name="max" id="max" placeholder="">
	                                    </div>
	                                </div>
	                            </div> -->
       	
                                <table id="show-hide-col" class="table" style="width:100%">
                                    <thead class="table-hover" style="border-bottom: none;">
                                        <tr>
                                            <th class="text-center">Id</th>
                                            <th class="text-center">Inscription</th>
                                            <th class="text-center">Mise à jour</th>
                                            <th>M. / Mme</th>
                                            <th>Nom</th>
                                            <th>Prénom</th>
                                            <th>Téléphone</th>
                                            <th>Mail</th>
                                            <th>Abonnement</th>
                                            <th class="text-center">Paiement</th>
                                            <th class="text-center">Sécurité</th>
                                            <th>Commentaires</th>
                                            <th class="text-center dt-no-sorting">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <% 
                                    for ( ClientsTerraBean ct : ctBeanCol) { 
                                    %>
                                        <tr onclick="show('<%= ct.getId() %>')">
                                            <td class="text-center"><%= ct.getId() %></td>
                                            <td class="text-center"><%= ct.getDateEnregistrement() %></td>
                                            <td class="text-center"><%= ct.getDateMAJ() %></td>
                                        <% if ( ct.getCivilite() == 1 ) { %>
                                        	<td class="text-center">M.</td>
                                        <% } else { %>
                                        	<td class="text-center">Mme</td>
                                        <% } %>
                                            <td><%= ct.getNom() %></td>
                                            <td><%= ct.getPrenom() %></td>
                                            <td><%= ct.getTel() %></td>
                                            <td><%= ct.getMail() %></td>
                                        <% 
                                        	String a = String.valueOf( ct.getAbonnement() ); 
                                        	if ( a.startsWith("1") ) {
                                        %>
                                            <td>Mensuel</td>
                                        <%
                                        	} else if ( a.startsWith("2") ) {
                                        %>
                                        	<td>Annuel</td>
										<%
                                        	} else {
                                        %>
                                        	<td>Sur-mesure</td>
										<%
                                        	}
                                        	
                                        	if ( a.endsWith("0") ) {
                                        %>
                                        	<td class="text-center"><span class="shadow-none badge badge-info">À jour</span></td>
                                        <%
                                        	} else if ( a.endsWith("1") ) {
                                        %>
                                        	<td class="text-center"><span class="shadow-none badge badge-warning">En attente</span></td>
										<%
                                        	} else {
                                        %>
                                        	<td class="text-center"><span class="shadow-none badge badge-danger">Bloqué</span></td>
										<%
                                        	}
                                        	
                                        	if ( ct.getStatut() == 1 ) {
                                        %>
                                        	<td class="text-center"><span class="shadow-none badge badge-danger">Hacké</span></td>
                                        <%
                                        	} else {
                                        %>
                                        	<td class="text-center"> - </td>
                                        <%
                                        	}
                                        	
                                        	if ( ct.getCommentaire() != null ) {
                                        %>
                                            <td><%= ct.getCommentaire() %></td>
                                        <% } else { %>
                                        	<td></td>
                                        <% } %>
                                            <td class="text-center">
												<div class="btn-group">
	                                                <button type="button" class="btn btn-dark btn-sm">Open</button>
	                                                <button type="button" class="btn btn-dark btn-sm dropdown-toggle dropdown-toggle-split" id="dropdownMenuReference1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-reference="parent">
	                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-down"><polyline points="6 9 12 15 18 9"></polyline></svg>
	                                                </button>
	                                                <div class="dropdown-menu" aria-labelledby="dropdownMenuReference1">
	                                                    <a class="dropdown-item" href="#">Modifier</a>
	                                                    <a class="dropdown-item" href="#">Supprimer</a>
	                                                    <a class="dropdown-item" href="#">Archiver</a>
	                                                    <!-- <div class="dropdown-divider"></div>
	                                                    <a class="dropdown-item" href="#">Separated link</a> -->
	                                                </div>
	                                            </div>
                                            </td>
                                        </tr>
									<% 
                                    }
									%>
                                    </tbody>
                                    <tfoot>
                                        <tr style="background: rgba(234, 241, 255, 0.74);">
                                            <th>Id</th>
                                            <th>Inscription</th>
                                            <th>Mise à jour</th>
                                            <th>M. / Mme</th>
                                            <th>Nom</th>
                                            <th>Préom</th>
                                            <th>Téléphone</th>
                                            <th>Mail</th>
                                            <th>Abonnement</th>
                                            <th>Paiement</th>
                                            <th>Sécurité</th>
                                            <th>Commentaires</th>
                                            <th class="invisible"></th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 
                <td><span class="shadow-none badge badge-primary">Approved</span></td>
                <td><span class="shadow-none badge badge-warning">Pending</span></td>
                <td><span class="shadow-none badge badge-danger">Suspended</span></td>
                 -->
                
			</div>
			
			<!-- Modal -->
			
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <!-- rotateInDownLeft -->
                <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                <!-- modal-dialog modal-dialog-centered -->
                <!-- modal animated rotateInDownLeft custo-rotateInDownLeft show -->
                    <div class="modal-content">
                        <div class="modal-header" style="background: rgba(234, 241, 255, 0.74);">
                            <h5 class="modal-title" id="exampleModalLabel">Date d’inscription : <span id="dateEnregisterment"></span></h5>
                            <hr>
                            <h5 class="modal-title" >Dernière mise à jour : <span id="dateMAJ"></span></h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <svg aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form class="contact-form" id="inscriptionForm" method="post" action="Inscription">
                            <%-- <%
							if (session.getAttribute("messageInscriptionValide") != null) {
							%> --%>
								<div id="ficheMiseAJour" class="form-group">
									<!-- <div class="alert alert-success text-center" role="alert"> -->
										<%-- <%= session.getAttribute("messageInscriptionValide")%> --%>
									<!-- </div> -->
								</div>	
							<%-- <%
							}
							%> --%>
							<%
							if (session.getAttribute("messageInscriptionInvalide") != null) {
							%>
								<div class="form-group">
									<div class="alert alert-danger" role="alert">
										<%= session.getAttribute("messageInscriptionInvalide")%>
									</div>
								</div>	
							<%
							}
							%>
                            	<input id="idClient" type="hidden" name="buttonInscription">
                            	<div class="row">
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                        	<label for="abonnementModal">Type d’abonnement</label>
                                            <select
                                            	style="width: 100%; height: calc(1.4em + 1.4rem + 2px); border: 1px solid #bfc9d4; 
                                            			border-radius:6px; letter-spacing: 1px; font-size: 15px; color: #3b3f5c; padding: 0.75rem 1.25rem;" 
                                            	id="abonnementModal" name="abonnementModal" 
											>
                                                <!-- <option selected>Open this select menu</option> -->
                                                <option id="mensuel" value="10">Mensuel</option>
                                                <option id="annuel" value="20">Annuel</option>
                                                <option id="surMesure" value="30">Sur-mesure</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                        	<label for="paiementModal">Paiement</label>
                                            <select
                                            	style="width: 100%; height: calc(1.4em + 1.4rem + 2px); border: 1px solid #bfc9d4; 
                                            			border-radius:6px; letter-spacing: 1px; font-size: 15px; color: #3b3f5c; padding: 0.75rem 1.25rem;" 
                                            	id="paiementModal" name="paiementModal" 
                                            >
                                                <!-- <option selected>Open this select menu</option> -->
                                                <option id="aJour" value="0">À jour</option>
                                                <option id="enAttente" value="1" style="color: #fff; background: #e2a03f;">En attente</option>
                                                <option id="suspendu" value="2">Compte bloqué</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label for="secuModal">Sécurité</label>
                                            <select
                                            	style="width: 100%; height: calc(1.4em + 1.4rem + 2px); border: 1px solid #bfc9d4; 
                                            			border-radius:6px; letter-spacing: 1px; font-size: 15px; color: #3b3f5c; padding: 0.75rem 1.25rem;" 
                                            	id="secuModal" name="secuModal"
                                            >
                                                <!-- <option selected>Open this select menu</option> -->
                                                <option id="toutVaBien" value="0">Tout va bien</option>
                                                <option id="hacked" value="1">Hacké !!!</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6" >
                                        <div class="form-group" >
                                        	<!-- class="selectpicker" -->
                                        	<label for="civiliteModal">Civilité</label>
                                            <select 
                                            	style="width: 100%; height: calc(1.4em + 1.4rem + 2px); border: 1px solid #bfc9d4; 
                                            		border-radius:6px; letter-spacing: 1px; font-size: 15px; color: #3b3f5c; padding: 0.75rem 1.25rem;"
                                            	id="civiliteModal" name="civiliteInscription" >
                                                <!-- <option selected>Open this select menu</option> -->
                                                <option id="monsieur" value="1" >Monsieur</option>
                                                <option id="madame" value="2" >Madame</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <!-- <div class="col-sm-12" id="result"></div> -->
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                        	<label for="nomClient">Nom</label>
                                            <input class="form-control" type="text" placeholder="Nom" 
                                            	id="nomClient" 
                                            	name="nomInscription" required >
                                            <%
											if (session.getAttribute("messageInvalidFirstName") != null) {
											%>
												<div class="form-group">
													<div class="alert alert-danger text-center" role="alert">
														<%= session.getAttribute("messageInvalidFirstName")%>
													</div>
												</div>
												
    			
											<%
											}
											%>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                        	<label for="prenomClient">Prénom</label>
                                            <input class="form-control" type="text" placeholder="Prénom" 
                                            	id="prenomClient" 
                                            	name="prenomInscription" required >
                                            <%
											if (session.getAttribute("messageInvalidLastName") != null) {
											%>
												<div class="form-group">
													<div class="alert alert-danger text-center" role="alert">
														<%= session.getAttribute("messageInvalidLastName")%>
													</div>
												</div>	
											<%
											}
											%>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <!-- <div class="col-sm-12" id="result"></div> -->
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                        	<label for="telClient">Téléphone</label>
                                            <input class="form-control" type="text" placeholder="Téléphone" 
                                            	id="telClient" 
                                            	name="telInscription" required>
                                            <%
											if (session.getAttribute("messageInvalidFrenchTel") != null) {
											%>
												<div class="form-group">
													<div class="alert alert-danger text-center" role="alert">
														<%= session.getAttribute("messageInvalidFrenchTel")%>
													</div>
												</div>	
											<%
											}
											%>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                        	<label for="mailClient">Mail</label>
                                            <input class="form-control" type="text" placeholder="Email" 
                                            	id="mailClient" 
                                            	name="mailInscription" required>
                                            <%
											if (session.getAttribute("messageEmailIsInDatabase") != null) {
											%>
												<div class="form-group">
													<div class="alert alert-danger text-center" role="alert">
														<%= session.getAttribute("messageEmailIsInDatabase")%>
													</div>
												</div>	
											<%
											}
											%>
											<%
											if (session.getAttribute("messageInvalidEmail") != null) {
											%>
												<div class="form-group">
													<div class="alert alert-danger text-center" role="alert">
														<%= session.getAttribute("messageInvalidEmail")%>
													</div>
												</div>	
											<%
											}
											%>
                                        </div>
                                    </div>
								</div>
								<div class="row">
                                    <div class="col-lg-12" >
                                        <div class="form-group" >
                                        	<!-- 
                                        	style="width: 100%; height: calc(1.4em + 1.4rem + 2px); border: 1px solid #bfc9d4; 
                                            	border-radius:6px; letter-spacing: 1px; font-size: 15px; color: #3b3f5c; padding: 0.75rem 1.25rem;" 
                                            -->
											<label for="commentaireClient">Commentaires</label>
											<textarea
												style="border: 1px solid #bfc9d4; 
                                            		border-radius:6px; letter-spacing: 1px; font-size: 15px; color: #3b3f5c; padding: 0.75rem 1.25rem;" 
												id="commentaireClient" name="story"rows="5" cols="95"></textarea>
                                        </div>
                                    </div>
                                </div>
                                    
                                    
                                <!--Button-->
                                <!-- <a href="#" id="inscriptionButton" class="btn btn-large btn-rounded btn-green d-block mt-4">
                                	<i class="fa fa-spinner fa-spin mr-2 d-none" aria-hidden="true"></i>Inscription</a> -->

                            </form>
                        </div>
                        <div class="modal-footer" style="justify-content: space-between;">
                            <button id="archiverClient" type="button" class="btn btn-danger"><i class="flaticon-cancel-12"></i>Archiver</button> <!-- data-dismiss="modal" -->
                            <button id="mettreAJourClient" type="button" class="btn btn-primary">Mettre à jour</button>
                            <%-- <tr onclick="show('<%= ct.getId() %>')"> --%>
                        </div>
                    </div>
                </div>
            </div>
			
        	<jsp:include page="/Footer" />
        	
        </div>
        <!--  END CONTENT AREA  -->

    </div>
    <!-- END MAIN CONTAINER -->
    
    
    
    <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
    <script src="assets/js/libs/jquery-3.1.1.min.js"></script>
    <script src="bootstrap/js/popper.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="plugins/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="assets/js/app.js"></script>
    
    <script>
	$(document).ready(function() {
	    App.init();
	});
    </script>
    
	<script src="plugins/highlight/highlight.pack.js"></script>
    <script src="assets/js/custom.js"></script>
    <!-- END GLOBAL MANDATORY SCRIPTS -->
    
    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="assets/js/scrollspyNav.js"></script>
    <script src="plugins/bootstrap-select/bootstrap-select.min.js"></script>
    <script src="plugins/table/datatable/datatables.js"></script>
    <!-- NOTE TO Use Copy CSV Excel PDF Print Options You Must Include These Files  -->
    <script src="plugins/table/datatable/button-ext/dataTables.buttons.min.js"></script>
    <script src="plugins/table/datatable/button-ext/jszip.min.js"></script>    
    <script src="plugins/table/datatable/button-ext/buttons.html5.min.js"></script>
    <script src="plugins/table/datatable/button-ext/buttons.print.min.js"></script>
    <!-- <script src="plugins/table/datatable/custom_miscellaneous.js"></script> -->
    <!-- END PAGE LEVEL SCRIPTS -->
    
    <script type="text/javascript">

    function setModal(o) {
    	console.log( o );
    	
		$("#idClient").val( o.id );
		
		$("#dateEnregisterment").text( o.dateEnregistrement ); /* https://github.com/phstc/jquery-dateFormat */
		$("#dateMAJ").text( o.dateMAJ );
		
		if ( o.abonnement == "10" || o.abonnement == "11" || o.abonnement == "12" ) {
			$("#mensuel").attr( "selected", "" );
		} else if ( o.abonnement == "20" || o.abonnement == "21" || o.abonnement == "22" ) {
			$("#annuel").attr( "selected", "" );
		} else if ( o.abonnement == "30" || o.abonnement == "31" || o.abonnement == "32" ){
			$("#surMesure").attr( "selected", "" );
		}
		
		if ( o.abonnement == "10" || o.abonnement == "20" || o.abonnement == "30" ) {
			$("#aJour").attr( "selected", "" );
		} else if ( o.abonnement == "11" || o.abonnement == "21" || o.abonnement == "31" ) {
			$("#enAttente").attr( "selected", "" );
		} else {
			$("#suspendu").attr( "selected", "" );
		}
		
		$("#securiteClient").val( o.statut );
		
		if ( o.civilite == "1" ) {
			$("#monsieur").attr( "selected", "" );
		} else {
			$("#madame").attr( "selected", "" );
		}
		$("#mailClient").val( o.mail );
		$("#nomClient").val( o.nom );
		$("#prenomClient").val(o.prenom);
		// alert(o.prenom);
		if ( o.statut == "0" ) {
			$("#toutVaBien").attr( "selected", "" );
		} else {
			$("#hacked").attr( "selected", "" );
		}
		$("#telClient").val( o.tel );
		$("#commentaireClient").text( o.commentaire );
    }
    
    function clearModal() {
    	
    	$("#idClient").val( "" );
		
		$("#dateEnregisterment").text( "" );
		$("#dateMAJ").text( "" ); 
		
		$("#mensuel").removeAttr( "selected" );
		$("#annuel").removeAttr( "selected" );
		$("#surMesure").removeAttr( "selected" );
		
		$("#aJour").removeAttr( "selected" );
		$("#enAttente").removeAttr( "selected" );
		$("#suspendu").removeAttr( "selected" );
		
		$("#toutVaBien").removeAttr( "selected" );
		$("#hacked").removeAttr( "selected" );		
		
		$("#monsieur").removeAttr( "selected" );
		$("#madame").removeAttr( "selected" );
		
		$("#nomClient").val( "" );
		$("#prenomClient").val( "" );
		$("#telClient").val( "" );
		$("#mailClient").val( "" );
		$("#commentaireClient").text( "" );	
    }
    
    function showVirginModal() {
    	clearModal();
    	$("#alertSuccess").remove();
    	$("#exampleModal").modal();
    };
    function show(n) {
        /* alert(n); */
        /* $("#alertSuccess").remove(); */
        clearModal();
        $.ajax( { /* récupérer la méthode AJAX */
    		url : "rest/client/get/" + n + "?ts=" + new Date().getTime(), // éviter de récupérer des infos du cache grâce à une URL unique
    		dataType: "json",
    		success: function( o ) {
    			console.log( o );
    			/* clearModal(); */
    			setModal(o);
    			/* 
    			$("#exampleModal").modal();
    			$("#alertSuccess").remove();
    			 */
    		},
    		error:function( xhr, message, ex ){
    			$( "body" ).alert( "Erreur requête Ajax..." );
    			$( "ficheMiseAJour" ).html('<div id="alertSuccess" class="alert alert-danger text-center" role="alert">Erreur requête Ajax...</div>');
    			console.log( message );
    		}
    	} );
        //clearModal();
		/* 
		*/
		$("#exampleModal").modal();
		
		
		$("#alertSuccess").remove(); 
		
    };
   	
    function save(isArchived) {
    	
    	var idShow = $("#idClient").val();
    	
    	console.log( isArchived );
        $.ajax({
        	url: "rest/client/update/?ts=" + new Date().getTime(),
        	type: "POST",
        	headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        	data: {
        		id: idShow,
        		civilite: $("#civiliteModal").val(),
        		nom: "'" + $("#nomClient").val() + "'", 
        		prenom: "'" + $("#prenomClient").val() + "'",
        		tel: "'" + $("#telClient").val() + "'",
        		mail: "'" + $("#mailClient").val() + "'",
        		abonnement: $("#abonnementModal").val(),
        		paiement: $("#paiementModal").val(),
        		secu: $("#secuModal").val(),
        		commentaire: "'" + $("#commentaireClient").val() + "'",
        		archiver: isArchived
        	},
        	/*
        	contentType: "application/json; charset=utf-8",
            dataType: "json" 
            */
            success: function( o ) {
            	console.log( o );
    			$("#ficheMiseAJour").html(o);
            },
    		error:function( xhr, message, ex ){
    			$("#ficheMiseAJour").html('<div id="alertSuccess" class="alert alert-danger text-center" role="alert">Erreur requête Ajax...</div>');
    			console.log( message );
    		}
        } );
        $("#alertSuccess").remove();
    };

    /*
		PAS UTILISÉ
		Range filtering
	*/
    /* Custom filtering function which will search data in column four between two values */
    $.fn.dataTable.ext.search.push(
        function( settings, data, dataIndex ) {
            var min = parseInt( $('#min').val(), 10 );
            var max = parseInt( $('#max').val(), 10 );
            var age = parseFloat( data[3] ) || 0; // use data for the age column
     
            if ( ( isNaN( min ) && isNaN( max ) ) ||
                 ( isNaN( min ) && age <= max ) ||
                 ( min <= age   && isNaN( max ) ) ||
                 ( min <= age   && age <= max ) )
            {
                return true;
            }
            return false;
        }
    );
    
    $(document).ready(function() {
    	
    	/*
	 		PAS UTILISÉ
	 		Range filtering
	 	*/
	    $('#min, #max').keyup( function() { table.draw(); } );
    	
    	/*
    		Update or Create client
    	*/
	    $("#mettreAJourClient").click( function( event ) {
			
			save(false);
			
		});
    	
    	/*
    		Archiver client
    	*/
		$("#archiverClient").click( function( event ) {
			
			save(true);
			
		});
	    
    	
        /*
        	COPY, CSV, EXCELL, PRINT
        	SHOW HIDE COLUMN
        */
        var table = $('#show-hide-col').DataTable( {
        	"pagingType": "full_numbers",
            "dom": "<'dt--top-section'<'row'<'col-sm-12 col-md-11 d-flex justify-content-md-start justify-content-center'B><'col-sm-12 col-md-1 d-flex justify-content-md-end justify-content-center mt-md-0 mt-3'f>>>" +
            "<'dt--top-section'<'row'<'col-12 col-sm-6 d-flex justify-content-sm-start justify-content-center'l><'col-12 col-sm-6 d-flex justify-content-sm-end justify-content-center mt-sm-0 mt-3'>>>" +
            "<'table-responsive'tr>" +
            "<'dt--bottom-section d-sm-flex justify-content-sm-between text-center'<'dt--pages-count  mb-sm-0 mb-3'i><'dt--pagination'p>>",
            "oLanguage": {
                "oPaginate": { 
                    "sFirst": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-left"><polyline points="15 18 9 12 15 6"></polyline></svg>',
                    "sPrevious": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>',
                    "sNext": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>',
                    "sLast": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg>'
                },
                "sInfo": "Showing page _PAGE_ of _PAGES_",
                "sSearch": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>',
                "sSearchPlaceholder": "Search...",
               "sLengthMenu": "Results :  _MENU_",
            },
            "stripeClasses": [],
            "lengthMenu": [10, 20, 50, 100],
            "pageLength": 10,
            buttons: [
                { extend: 'copy', className: 'btn btn-sm' },
                { extend: 'csv', className: 'btn btn-sm' },
                { extend: 'excel', className: 'btn btn-sm' },
                { extend: 'print', className: 'btn btn-sm' },
                {
                    text: 'id',
                    className: 'btn btn-primary btn-sm toggle-vis mb-1',
                    action: function(e, dt, node, config ) {
                        var column = table.column( 0 );
                        column.visible( ! column.visible() );
                    }
                },
                {
                    text: 'Inscription',
                    className: 'btn btn-primary btn-sm toggle-vis mb-1',
                    action: function(e, dt, node, config ) {
                        var column = table.column( 1 );
                        column.visible( ! column.visible() );
                    }
                },
                {
                    text: 'Mise à jour',
                    className: 'btn btn-primary btn-sm toggle-vis mb-1',
                    action: function(e, dt, node, config ) {
                        var column = table.column( 2 );
                        column.visible( ! column.visible() );
                    }
                },
                {
                    text: 'Civilité',
                    className: 'btn btn-primary btn-sm toggle-vis mb-1',
                    action: function(e, dt, node, config ) {
                        var column = table.column( 3 );
                        column.visible( ! column.visible() );
                    }
                },
                {
                    text: 'Nom',
                    className: 'btn btn-primary btn-sm toggle-vis mb-1',
                    action: function(e, dt, node, config ) {
                        var column = table.column( 4 );
                        column.visible( ! column.visible() );
                    }
                },
                {
                    text: 'Prénom',
                    className: 'btn btn-primary btn-sm toggle-vis mb-1',
                    action: function(e, dt, node, config ) {
                        var column = table.column( 5 );
                        column.visible( ! column.visible() );
                    }
                },
                {
                    text: 'Téléphone',
                    className: 'btn btn-primary btn-sm toggle-vis mb-1',
                    action: function(e, dt, node, config ) {
                        var column = table.column( 6 );
                        column.visible( ! column.visible() );
                    }
                },
                {
                    text: 'Mail',
                    className: 'btn btn-primary btn-sm toggle-vis mb-1',
                    action: function(e, dt, node, config ) {
                        var column = table.column( 7 );
                        column.visible( ! column.visible() );
                    }
                },
                {
                    text: 'Abonnement',
                    className: 'btn btn-primary btn-sm toggle-vis mb-1',
                    action: function(e, dt, node, config ) {
                        var column = table.column( 8 );
                        column.visible( ! column.visible() );
                    }
                },
                {
                    text: 'Paiement',
                    className: 'btn btn-primary btn-sm toggle-vis mb-1',
                    action: function(e, dt, node, config ) {
                        var column = table.column( 9 );
                        column.visible( ! column.visible() );
                    }
                },
                {
                    text: 'Sécurité',
                    className: 'btn btn-primary btn-sm toggle-vis mb-1',
                    action: function(e, dt, node, config ) {
                        var column = table.column( 10 );
                        column.visible( ! column.visible() );
                    }
                },
                {
                    text: 'Commentaires',
                    className: 'btn btn-primary btn-sm toggle-vis mb-1',
                    action: function(e, dt, node, config ) {
                        var column = table.column( 11 );
                        column.visible( ! column.visible() );
                    }
                },
            ]
        } );
        

    	/*
    		SEARCH BOTTOM
    	*/
    	// Setup - add a text input to each footer cell
        $('#show-hide-col tfoot th').each( function () {
            var title = $(this).text();
            $(this).html( '<input type="text" class="form-control" placeholder="..."/>' ); /* Search ' + title + ' */
        } );
    	
        table.columns().every( function () {
            var that = this;
     
            $( 'input', this.footer() ).on( 'keyup change', function () {
                if ( that.search() !== this.value ) {
                    that
                        .search( this.value )
                        .draw();
                }
            } );
        } );
    	
    	/*
    		HOVER : griser la ligne au passage de la souris
    	*/
        var table = $('#show-hide-col').DataTable();
        
        $("tbody tr").hover( /* not(':first').hover */
			function () {
				$(this).css("background","#ddd");
			}, 
			function () {
				$(this).css("background","");
			}
		);

    } );
    </script>   
</body>
</html>