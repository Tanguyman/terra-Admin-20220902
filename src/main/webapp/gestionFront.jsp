<%@page import="fr.terraAdmin.beans.CoordonneesTerraBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="fr.terraAdmin.beans.CoordonneesTerraBean"%>
<%@ page import="fr.terraAdmin.beans.SliderBean"%>
<%@ page import="fr.terraAdmin.beans.LivreDOrBean"%>
<%@ page import="fr.terraAdmin.beans.LivreDOrLogosBean"%>
<%@ page import="fr.terraAdmin.beans.OffresBean"%>
<%@ page import="java.util.ArrayList"%>
<%
CoordonneesTerraBean cb = (CoordonneesTerraBean) request.getAttribute("cb");
ArrayList<OffresBean> oCol = (ArrayList) request.getAttribute("oCol");
ArrayList<SliderBean> sbCol = (ArrayList) request.getAttribute("sbCol");
ArrayList<LivreDOrBean> lbCol = (ArrayList) request.getAttribute("lbCol");
ArrayList<LivreDOrLogosBean> llbCol = (ArrayList) request.getAttribute("llbCol");
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <title>Gestion du front</title>
    <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico"/>
    <link href="assets/css/loader.css" rel="stylesheet" type="text/css" />
    <script src="assets/js/loader.js"></script>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="https://fonts.googleapis.com/css?family=Quicksand:400,500,600,700&display=swap" rel="stylesheet">
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/plugins.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->

    <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM STYLES -->
    <link href="assets/css/scrollspyNav.css" rel="stylesheet" type="text/css" />
    <link href="plugins/apex/apexcharts.css" rel="stylesheet" type="text/css">
    <link href="assets/css/dashboard/dash_1.css" rel="stylesheet" type="text/css" />
    <style class="dark-theme">
        # chart-2 { /* camembert */
            stroke: #0e1726;
        }
    </style>
    <!-- END PAGE LEVEL PLUGINS/CUSTOM STYLES -->
    
    <!-- BEGIN PAGE LEVEL STYLES -->
    <link rel="stylesheet" type="text/css" href="plugins/table/datatable/datatables.css">
    <link rel="stylesheet" type="text/css" href="plugins/table/datatable/dt-global_style.css">
    <link rel="stylesheet" type="text/css" href="plugins/table/datatable/custom_dt_miscellaneous.css">
    <link rel="stylesheet" type="text/css" href="assets/css/forms/theme-checkbox-radio.css">
    <link href="plugins/file-upload/file-upload-with-preview.min.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL STYLES -->

</head>
<body class="alt-menu sidebar-noneoverflow">

    <!-- BEGIN LOADER NAVBAR -->
	<jsp:include page="/Header" />
    <!--  END LOADER NAVBAR -->
	
    <!--  BEGIN MAIN CONTAINER  -->
    <div class="main-container" id="container">

        <div class="overlay"></div>
        <div class="search-overlay"></div>
        
        <!--  BEGIN CONTENT PART  -->
        <div id="content" class="main-content">
            <div class="layout-px-spacing">
                <div class="row layout-top-spacing">
					<!-- <div class="col-xl-8 col-lg-12 col-md-12 col-sm-12 col-12 layout-spacing"> -->
                    <div id="tabsWithIcons" class="col layout-spacing"><!-- col-lg-12 col-12 -->
                        <div class="statbox widget box box-shadow">
                            <!-- <div class="widget-header">
                                <div class="row">
                                    <div class="col-xl-12 col-md-12 col-sm-12 col-12">
                                        <h4>Pills with Icon</h4>
                                    </div>
                                </div>
                            </div> -->
                            <div class="widget-content widget-content-area rounded-pills-icon">
                                
                                <ul class="nav nav-pills mb-4 mt-3  justify-content-center" id="rounded-pills-icon-tab" role="tablist">
                                    <li class="nav-item ml-2 mr-2">
                                        <a class="nav-link mb-2 text-center active" id="rounded-pills-icon-home-tab" data-toggle="pill" href="#rounded-pills-icon-home" role="tab" aria-controls="rounded-pills-icon-home" aria-selected="true">
                                        	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path></svg>  Terra</a>
                                    </li>
                                    <li class="nav-item ml-2 mr-2">
                                        <a class="nav-link mb-2 text-center" id="rounded-pills-icon-profile-tab" data-toggle="pill" href="#rounded-pills-icon-profile" role="tab" aria-controls="rounded-pills-icon-profile" aria-selected="false">
                                        	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-camera"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"></path><circle cx="12" cy="13" r="4"></circle></svg>  Slider</a>
                                    </li>
                                    <li class="nav-item ml-2 mr-2">
                                        <a class="nav-link mb-2 text-center" id="rounded-pills-icon-profileLost-tab" data-toggle="pill" href="#rounded-pills-icon-profileLost" role="tab" aria-controls="rounded-pills-icon-profileLost" aria-selected="false">
                                        	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-book-open"><path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"></path><path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"></path></svg>  Témoignages</a>
                                    </li>
                                </ul>

                                <div class="tab-content" id="rounded-pills-icon-tabContent">
                                
                                
                                
                                	<!-- ***************************************************************** 
                                	
										TERRA
										
									***************************************************************** -->
                                    <div class="tab-pane fade active show" id="rounded-pills-icon-home" role="tabpanel" aria-labelledby="rounded-pills-icon-home-tab">
										<!-- <h6 class="mb-0 text-uppercase">Infos Terra + tarifs</h6> -->
										<!-- <a href="#">Détails</a> -->
										<!-- <hr/> -->
										<div class="row">
		                					<div class="card col-md-6">
		                  						<div class="card-body">
		                    						<h6 class="mb-0 text-uppercase">Modifier les informations de l’entreprise</h6>
						                			<hr/>
													<!-- <form class="row g-5" method="post" action="SiteFrontOffice" enctype="multipart/form-data"> -->
													<form id="entrepriseForm" class="contact-form" method="post" action="" enctype="application/x-www-form-urlencoded">
														<input id="idSlideHidden" type="hidden" name="idTerraHidden">
														<div id="coordonneesTerraMiseAJour" class="form-group"></div>
														<div class="row">
															<div class="col-md-6">
																<label class="form-label">Logo actuel</label>
																<br><br><br><br><br>
																<img src="<%= cb.getLogoURL() %>" alt="image"  width="100%">
															</div>
						                                    <!-- <div class="col-lg-4"> -->
															<div class="col-md-6">
						                                        <div class="form-group">
						                                        
																	<!-- <label for="logoFile" class="form-label">Choisir un nouveau logo</label>
																	<input class="custom-file-container__custom-file__custom-file-input" type="file" name="logoFile" id="logoFile"/> -->
																	<div class="custom-file-container" data-upload-id="myFirstImage">
																	    <label>Choisir un nouveau logo <a href="javascript:void(0)" class="custom-file-container__image-clear" title="Clear Image">x</a></label>
																	    <label class="custom-file-container__custom-file" >
																	        <input id="logoUrlEntreprise" name="logoUrlEntreprise" type="file" class="custom-file-container__custom-file__custom-file-input" accept="image/*">
																	        <input type="hidden" name="MAX_FILE_SIZE" value="10485760" />
																	        <span class="custom-file-container__custom-file__custom-file-control"></span>
																	    </label>
																	    <div class="custom-file-container__image-preview"></div>
																	</div>
																</div>
															</div>
															<div class="col-md-4">
																<label class="form-label">Nom de l’entreprise</label>
																<input id="nomEntreprise" type="text" name="nomEntreprise" class="form-control" value="<%= cb.getNom() %>"/>
															</div>
															<div class="col-md-4">
																<label class="form-label">Téléphone</label>
																<input id="telEntreprise" type="text" name="telEntreprise" class="form-control" value="<%= cb.getTel() %>"/>
															</div>
															<div class="col-md-4">
																<label class="form-label">Email</label>
																<input id="mailEntreprise" type="text" name="mailEntreprise" class="form-control" value="<%= cb.getMail() %>"/>
															</div>
															<div class="col-md-12 mt-3">
																<label class="form-label">Adresse</label>
																<input id="adresseEntreprise" type="text" name="adresseEntreprise" class="form-control" value="<%= cb.getAdresse() %>"/>
															</div>
														</div>
														<!-- <div class="col-md-3"> -->
														<div class="col text-right mt-3">
															<!-- <div class="d-grid"> -->
																<button id="mettreAJourCoordonneesTerra" type="button" class="btn btn-warning" name="mettreAJourCoordonneesTerra">Mettre à jour les coordonnées</button>
																<!-- <input type="submit" class="btn btn-warning" name="updateCompany" value="Mettre à jour les coordonnées" /> -->
																<!-- <button id="virginModal" type="button" class="btn btn-primary" onclick="showVirginModal()">Ajouter un abonné</button> -->
															<!-- </div> -->
														</div>
													</form>
		                  						</div>
		                					</div>
	                                    	<div class="card col-md-6 m2">
		                  						<div class="card-body">
		                    						<h6 class="mb-0 text-uppercase">Modifier le prix des abonnements</h6>
						                			<hr/>
						                			<div id="abonnementAlert" class="form-group"></div>
													<div class="row">
													<%
													for ( OffresBean offre : oCol ) { 
													%>
														<div class="col-md-6">
						                					<form class="contact-form" id="offresForm" method="post" action="">
																<label for="offres<%= offre.getId() %>" class="form-label"><%= offre.getTitreAbonnement() %> (en €)</label>
																<input id="prixAbonnement<%= offre.getId() %>" type="text" name="prixAbonnement" class="form-control" value="<%= offre.getPrix() %>"/>
																<button id="mettreAJourAbonnement<%= offre.getId() %>" type="button" class="btn btn-warning text-right mt-3" name="updateCompany">Mettre à jour les abonnements</button>
															</form>
														</div>
													<% 
													} 
													%>
													</div>		
						                		</div>
						                	</div>
					                	</div>
                                    </div>

									
									
									<!-- *****************************************************************  
									
										SLIDER
										
									***************************************************************** -->
                                    <div class="tab-pane fade" id="rounded-pills-icon-profile" role="tabpanel" aria-labelledby="rounded-pills-icon-profile-tab">
										<!-- 
                                       	<h6 class="mb-0 text-uppercase">Slider</h6>
											<a href="#">Détails</a> 
										<hr/>
	                					<div class="card">
	                  						<div class="card-body">
										-->
	                    						<!-- <div id="nouveauxAbonnes"></div> -->
	                    						<div id="alertAjax" class="form-group"></div>
	                    						
	                    						<div class="row layout-spacing">
								                    <div class="col text-center">
								                    	<button id="virginModal" type="button" class="btn btn-primary" onclick="showVirginModalSlide()">Ajouter un nouveau slide au slider</button>
								                    </div>
												</div>
												
												<div class="row layout-spacing">
								                    <div class="col-lg-12">
								                        <div class="statbox widget box box-shadow">
								                            <div id="sliderTable" class="widget-content widget-content-area">
								                                <table id="show-hide-col" class="table" style="width:100%">
								                                    <thead class="table-hover" style="border-bottom: none;">
								                                        <tr>
								                                            <th class="text-center">Id</th>
								                                            <th>Image</th>
								                                            <th>Titre</th>
								                                            <th>Descrition</th>
								                                            <th>Titre bouton</th>
								                                            <th>Url bouton</th>
								                                            <th>Archiver</th>
								                                            <!-- <th class="text-center">Paiement</th> -->
								                                            <!-- <th class="text-center dt-no-sorting">Action</th> -->
								                                        </tr>
								                                    </thead>
								                                    <tbody>
								                                    <% 
								                                    for ( SliderBean ct : sbCol) { 
								                                    %>
								                                        <tr id="tr<%= ct.getId() %>" onclick="showModalSlide('<%= ct.getId() %>')">
								                                            <td class="text-center"><%= ct.getId() %></td>
								                                            <td><img alt="image" width="100%" src="<%= ct.getImageURL() %>"></td>
								                                            <td><%= ct.getTitre() %></td>
								                                            <td><%= ct.getDescription() %></td>
								                                            <td><%= ct.getTitreBouton() %></td>
								                                            <td><%= ct.getUrlBouton() %></td>
								                                            <td><%= ct.isArchiver() %></td>
								                                        </tr>  
																	<% 
								                                    }
																	%>
								                                    </tbody>
								                                    <!-- <tfoot>
								                                        <tr style="background: rgba(234, 241, 255, 0.74);">
								                                            <th class="text-center">Id</th>
								                                            <th>Image</th>
								                                            <th>Titre</th>
								                                            <th>Descrition</th>
								                                            <th>Titre bouton</th>
								                                            <th>Url bouton</th>
								                                            <th>Archiver</th>
								                                            <th class="invisible"></th>
								                                        </tr>
								                                    </tfoot> -->
								                                </table>
								                            </div>
								                        </div>
								                    </div>
								                </div>
	                  						<!-- </div>
	                					</div> -->
                                    </div>
                                    
                                    
                                    
                                    <!-- *****************************************************************  
                                    
										TÉMOIGNAGES + LOGOS PARTENAIRES
										
									***************************************************************** -->
                                    <div class="tab-pane fade" id="rounded-pills-icon-profileLost" role="tabpanel" aria-labelledby="rounded-pills-icon-profileLost-tab">
										<!-- 
                                       	<h6 class="mb-0 text-uppercase">Témoignages</h6>
											<a href="#">Détails</a> 
										<hr/>
										-->
	                					<!-- <div class="card">
	                  						<div class="card-body"> -->
	                    						<!-- <div id="desinscriptions"></div> -->
	                    						<!-- <div id="alertAjax" class="form-group"></div> -->
	                    						
	                    						<div class="row layout-spacing">
								                    <div class="col text-center">
								                    	<button id="virginModal" type="button" class="btn btn-primary" onclick="showVirginModalSlide()">Ajouter un témoignage</button>
								                    </div>
												</div>
												
												<!-- *****************************************************************
												  
													TÉMOIGNAGES
												
												***************************************************************** -->
												<div class="row layout-spacing">
								                    <div class="col-lg-12">
								                        <div class="statbox widget box box-shadow">
								                            <div id="temoignageTable" class="widget-content widget-content-area">
								                                <table id="zero-config" class="table" style="width:100%">
								                                    <thead class="table-hover" style="border-bottom: none;">
								                                        <tr>
								                                            <th class="text-center">Id</th>
								                                            <th>Photo</th>
								                                            <th>Nom</th>
								                                            <th>Poste</th>
								                                            <th>Commentaire</th>
								                                            <th>Date commentaire</th>
								                                            <th>Archiver</th>
								                                            <!-- <th class="text-center">Paiement</th> -->
								                                            <!-- <th class="text-center dt-no-sorting">Action</th> -->
								                                        </tr>
								                                    </thead>
								                                    <tbody>
								                                    <% 
								                                    for ( LivreDOrBean ct : lbCol) { 
								                                    %>
								                                        <tr id="tr<%= ct.getId() %>" onclick="showModalTemoignages('<%= ct.getId() %>')">
								                                            <td class="text-center"><%= ct.getId() %></td>
								                                            <td><img alt="image" width="100%" src="<%= ct.getPhoto() %>"></td>
								                                            <td><%= ct.getNom() %></td>
								                                            <td><%= ct.getFonction() %></td>
								                                            <td><%= ct.getCommentaire() %></td>
								                                            <td><%= ct.getDateCommentaire() %></td>
								                                            <td><%= ct.isArchiver() %></td>
								                                        </tr>
																	<% 
								                                    }
																	%>
								                                    </tbody>
								                                    <!-- <tfoot>
								                                        <tr style="background: rgba(234, 241, 255, 0.74);">
								                                            <th class="text-center">Id</th>
								                                            <th>Image</th>
								                                            <th>Titre</th>
								                                            <th>Descrition</th>
								                                            <th>Titre bouton</th>
								                                            <th>Url bouton</th>
								                                            <th>Archiver</th>
								                                            <th class="invisible"></th>
								                                        </tr>
								                                    </tfoot> -->
								                                </table>
								                            </div>
								                        </div>
								                    </div>
								                </div>
	                  						<!-- </div>
	                					</div> -->
	                					
	                					
	                					
	                							<!-- *****************************************************************
												  
													LOGOS PARTENAIRES
												
												***************************************************************** -->
	                					
	                							<div class="row layout-spacing">
								                    <div class="col text-center">
								                    	<button id="virginModal" type="button" class="btn btn-primary" onclick="showVirginModalLogosPartenaires()">Ajouter un logo partenaire</button>
								                    </div>
												</div>
	                							<div class="row layout-spacing">
								                    <div class="col-lg-12">
								                        <div class="statbox widget box box-shadow">
								                            <!-- <div id="temoignageTable" class="widget-content widget-content-area"> -->
								                                <table id="style-3" class="table" style="width:100%">
								                                    <thead class="table-hover" style="border-bottom: none;">
								                                        <tr>
								                                            <th class="text-center">Id</th>
								                                            <th>Logo</th>
								                                            <th>Société</th>
								                                            <th>Archiver</th>
								                                        </tr>
								                                    </thead>
								                                    <tbody>
								                                    <% 
								                                    for ( LivreDOrLogosBean ct : llbCol) { 
								                                    %>
								                                        <tr id="tr<%= ct.getId() %>" onclick="showModalLogosPartenaires('<%= ct.getId() %>')">
								                                            <td class="text-center"><%= ct.getId() %></td>
								                                            <td><img alt="image" width="36%" src="<%= ct.getUrl() %>"></td>
								                                            <td><%= ct.getSociete() %></td>
								                                            <td><%= ct.isArchiver() %></td>
								                                        </tr>
																	<% 
								                                    }
																	%>
								                                    </tbody>
								                                </table>
								                            <!-- </div> -->
								                        </div>
								                    </div>
								                </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                
            </div>
            
            <!-- *****************************************************************
            
            	MODAL SLIDER
            	 
            ***************************************************************** -->
            <div class="modal fade" id="sliderModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <!-- rotateInDownLeft -->
                <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                <!-- modal-dialog modal-dialog-centered -->
                <!-- modal animated rotateInDownLeft custo-rotateInDownLeft show -->
                    <div class="modal-content">
                        <div class="modal-header" style="background: rgba(234, 241, 255, 0.74);">
                            <h5 class="modal-title" id="exampleModalLabel">Slide d’id <span id="titleModalTerra"></span></h5>
                            <!-- <hr>
                            <h5 class="modal-title" >Dernière mise à jour : <span id="dateMAJ"></span></h5> -->
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <svg aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form class="contact-form" id="sliderForm" method="post" action="" enctype="multipart/form-data">
								<div id="slideAlertMiseAJour" class="form-group">
									<!-- <div class="alert alert-success text-center" role="alert"> -->
										<%-- <%= session.getAttribute("messageInscriptionValide")%> --%>
									<!-- </div> -->
								</div>
							
                            	<input id="idSlideHidden" type="hidden" name="idSlideHidden">
                            	
                                <div class="row">
                                    <!-- <div class="col-sm-12" id="result"></div> -->
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                        	<label for="imageSlideModal">Image actuel</label>
                                        	<br>
                                        	<img alt="image" width="50%"  
                                            	id="imageSlideModal" 
                                            	name="imageSlideModal" >
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                        <!-- 
                                        	<label for="newImageSlideModal">Choisir une image en 1920 x 650</label>
                                            <input class="form-control" type="file" 
                                            	id="newImageSlideModal" 
                                            	name="newImageSlideModal" >
                                        -->
	                                        <label>Upload (Single File) <!-- <a href="javascript:void(0)" class="custom-file-container__image-clear" title="Clear Image">x</a> --></label>
	                                        <br>
										    <label class="custom-file-container__custom-file" >
										        <input type="file" class="custom-file-container__custom-file__custom-file-input" accept="image/*">
										        <input type="hidden" name="MAX_FILE_SIZE" value="10485760" />
										        <span class="custom-file-container__custom-file__custom-file-control"></span>
										    </label>
										    <div class="custom-file-container__image-preview"></div>
                                        </div> 
                                    </div>
                                </div>

                                <div class="row">
                                    <!-- <div class="col-sm-12" id="result"></div> -->
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                        	<label for="titreSlideModal">Titre slide</label>
                                            <input class="form-control" type="text" placeholder="titre slide" 
                                            	id="titreSlideModal" 
                                            	name="titreSlideModal" required >
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                        	<label for="titreBoutonSlideModal">Titre bouton</label>
                                            <input class="form-control" type="text" placeholder="Titre bouton" 
                                            	id="titreBoutonSlideModal" 
                                            	name="titreBoutonSlideModal" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                        	<label for="urlBoutonSlideModal">URL bouton</label>
                                            <input class="form-control" type="text" placeholder="Url bouton" 
                                            	id="urlBoutonSlideModal" 
                                            	name="urlBoutonSlideModal" required>
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
											<label for="descriptionSlideModal">Description slide</label>
											<textarea
												style="border: 1px solid #bfc9d4; 
                                            		border-radius:6px; letter-spacing: 1px; font-size: 15px; color: #3b3f5c; padding: 0.75rem 1.25rem;" 
												id="descriptionSlideModal" name="descriptionSlideModal"rows="5" cols="95"></textarea>
                                        </div>
                                    </div>
                                </div>
                                    
                                    
                                <!--Button-->
                                <!-- <a href="#" id="inscriptionButton" class="btn btn-large btn-rounded btn-green d-block mt-4">
                                	<i class="fa fa-spinner fa-spin mr-2 d-none" aria-hidden="true"></i>Inscription</a> -->

                            </form>
                        </div>
                        <div class="modal-footer" style="justify-content: space-between;">
                            <button id="archiverSlideModal" type="button" class="btn btn-danger"><i class="flaticon-cancel-12"></i>Archiver le slide</button> <!-- data-dismiss="modal" -->
                            <button id="mettreAJourSlideModal" type="button" class="btn btn-primary">Mettre à jour le slide</button>
                            <%-- <tr onclick="show('<%= ct.getId() %>')"> --%>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- *****************************************************************
            
            	MODAL TEMOIGNAGE
            	 
            ***************************************************************** -->
            <div class="modal fade" id="temoignagesModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <!-- rotateInDownLeft -->
                <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                <!-- modal-dialog modal-dialog-centered -->
                <!-- modal animated rotateInDownLeft custo-rotateInDownLeft show -->
                    <div class="modal-content">
                        <div class="modal-header" style="background: rgba(234, 241, 255, 0.74);">
                            <h5 class="modal-title" id="exampleModalLabel">Témoignage id : <span id="titleModalTemoignages"></span></h5>
                            <!-- <hr>
                            <h5 class="modal-title" >Dernière mise à jour : <span id="dateMAJ"></span></h5> -->
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <svg aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form class="contact-form" id="temoignagesForm" method="post" action="" enctype="multipart/form-data">
								<div id="slideAlertMiseAJour" class="form-group">
									<!-- <div class="alert alert-success text-center" role="alert"> -->
										<%-- <%= session.getAttribute("messageInscriptionValide")%> --%>
									<!-- </div> -->
								</div>
							
                            	<input id="idTemoignagesHidden" type="hidden" name="idTemoignagesHidden">
                            	
                                <div class="row">
                                    <!-- <div class="col-sm-12" id="result"></div> -->
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                        	<label for="photoTemoignagesModal">Photo actuel</label>
                                        	<br>
                                        	<img alt="image" width="50%"  
                                            	id="photoTemoignagesModal" 
                                            	name="photoTemoignagesModal" >
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                        <!-- 
                                        	<label for="newImageSlideModal">Choisir une image en 1920 x 650</label>
                                            <input class="form-control" type="file" 
                                            	id="newImageSlideModal" 
                                            	name="newImageSlideModal" >
                                        -->
	                                        <label>Upload (Single File) <!-- <a href="javascript:void(0)" class="custom-file-container__image-clear" title="Clear Image">x</a> --></label>
	                                        <br>
										    <label class="custom-file-container__custom-file" >
										        <input type="file" class="custom-file-container__custom-file__custom-file-input" accept="image/*">
										        <input type="hidden" name="MAX_FILE_SIZE" value="10485760" />
										        <span class="custom-file-container__custom-file__custom-file-control"></span>
										    </label>
										    <div class="custom-file-container__image-preview"></div>
                                        </div> 
                                    </div>
                                </div>

                                <div class="row">
                                    <!-- <div class="col-sm-12" id="result"></div> -->
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                        	<label for="nomTemoignagesModal">Nom</label>
                                            <input class="form-control" type="text" placeholder="titre slide" 
                                            	id="nomTemoignagesModal" 
                                            	name="nomTemoignagesModal" required >
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                        	<label for="dateTemoignagesModal">Date commentaire</label>
                                            <input class="form-control" type="text" placeholder="titre slide" 
                                            	id="dateTemoignagesModal" 
                                            	name="dateTemoignagesModal" required >
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                        	<label for="posteTemoignagesModal">Poste</label>
                                            <input class="form-control" type="text" placeholder="Titre bouton" 
                                            	id="posteTemoignagesModal" 
                                            	name="posteTemoignagesModal" required>
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
											<label for="commentaireTemoignagesModal">Commentaires</label>
											<textarea
												style="border: 1px solid #bfc9d4; 
                                            		border-radius:6px; letter-spacing: 1px; font-size: 15px; color: #3b3f5c; padding: 0.75rem 1.25rem;" 
												id="commentaireTemoignagesModal" name="commentaireTemoignagesModal"rows="5" cols="95"></textarea>
                                        </div>
                                    </div>
                                </div>
                                    
                                    
                                <!--Button-->
                                <!-- <a href="#" id="inscriptionButton" class="btn btn-large btn-rounded btn-green d-block mt-4">
                                	<i class="fa fa-spinner fa-spin mr-2 d-none" aria-hidden="true"></i>Inscription</a> -->

                            </form>
                        </div>
                        <div class="modal-footer" style="justify-content: space-between;">
                            <button id="archiverTemoignagesModal" type="button" class="btn btn-danger"><i class="flaticon-cancel-12"></i>Archiver le slide</button> <!-- data-dismiss="modal" -->
                            <button id="mettreAJourTemoignagesModal" type="button" class="btn btn-primary">Mettre à jour le slide</button>
                            <%-- <tr onclick="show('<%= ct.getId() %>')"> --%>
                        </div>
                    </div>
                </div>
            </div>
            
            
            
            <!-- *****************************************************************
            
            	MODAL LOGOS PARTENAIRES
            	 
            ***************************************************************** -->
            <div class="modal fade" id="logosPartenairesModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <!-- rotateInDownLeft -->
                <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                <!-- modal-dialog modal-dialog-centered -->
                <!-- modal animated rotateInDownLeft custo-rotateInDownLeft show -->
                    <div class="modal-content">
                        <div class="modal-header" style="background: rgba(234, 241, 255, 0.74);">
                            <h5 class="modal-title" id="exampleModalLabel">Logo id : <span id="titleModalLogosPartenaires"></span></h5>
                            <!-- <hr>
                            <h5 class="modal-title" >Dernière mise à jour : <span id="dateMAJ"></span></h5> -->
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <svg aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form class="contact-form" id="temoignagesForm" method="post" action="" enctype="multipart/form-data">
								<div id="slideAlertMiseAJour" class="form-group">
									<!-- <div class="alert alert-success text-center" role="alert"> -->
										<%-- <%= session.getAttribute("messageInscriptionValide")%> --%>
									<!-- </div> -->
								</div>
							
                            	<input id="idLogosPartenairesHidden" type="hidden" name="idLogosPartenairesHidden">
                            	
                                <div class="row">
                                    <!-- <div class="col-sm-12" id="result"></div> -->
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                        	<label for="urlLogosPartenairesModal">Logo actuel</label>
                                        	<br>
                                        	<img alt="image" width="50%"  
                                            	id="urlLogosPartenairesModal" 
                                            	name="urlLogosPartenairesModal" >
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                        <!-- 
                                        	<label for="newImageSlideModal">Choisir une image en 1920 x 650</label>
                                            <input class="form-control" type="file" 
                                            	id="newImageSlideModal" 
                                            	name="newImageSlideModal" >
                                        -->
	                                        <label>Upload (Single File) <!-- <a href="javascript:void(0)" class="custom-file-container__image-clear" title="Clear Image">x</a> --></label>
	                                        <br>
										    <label class="custom-file-container__custom-file" >
										        <input type="file" class="custom-file-container__custom-file__custom-file-input" accept="image/*">
										        <input type="hidden" name="MAX_FILE_SIZE" value="10485760" />
										        <span class="custom-file-container__custom-file__custom-file-control"></span>
										    </label>
										    <div class="custom-file-container__image-preview"></div>
                                        </div> 
                                    </div>
                                </div>

                                <div class="row">
                                    <!-- <div class="col-sm-12" id="result"></div> -->
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                        	<label for="societeLogosPartenairesModalModal">Nom de la société</label>
                                            <input class="form-control" type="text" placeholder="titre slide" 
                                            	id="societeLogosPartenairesModal" 
                                            	name="societeLogosPartenairesModal" required >
                                        </div>
                                    </div>
								</div>    
                                <!--Button-->
                                <!-- <a href="#" id="inscriptionButton" class="btn btn-large btn-rounded btn-green d-block mt-4">
                                	<i class="fa fa-spinner fa-spin mr-2 d-none" aria-hidden="true"></i>Inscription</a> -->

                            </form>
                        </div>
                        <div class="modal-footer" style="justify-content: space-between;">
                            <button id="archiverLogosPartenairesModalModal" type="button" class="btn btn-danger"><i class="flaticon-cancel-12"></i>Archiver le logo</button> <!-- data-dismiss="modal" -->
                            <button id="mettreAJourLogosPartenairesModalModal" type="button" class="btn btn-primary">Mettre à jour le logo</button>
                            <%-- <tr onclick="show('<%= ct.getId() %>')"> --%>
                        </div>
                    </div>
                </div>
            </div>
                           
			<jsp:include page="/Footer" />
            
        </div>
        <!--  END CONTENT PART  -->

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
    <script src="assets/js/custom.js"></script>
    <!-- END GLOBAL MANDATORY SCRIPTS -->

    <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM SCRIPTS -->
    <script src="plugins/apex/apexcharts.min.js"></script>
    <script src="assets/js/dashboard/dash_1.js"></script>
    <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM SCRIPTS -->

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
    <script src="plugins/file-upload/file-upload-with-preview.min.js"></script>

    <script>
        //First upload
        var chooseLogoTerra = new FileUploadWithPreview('myFirstImage')
        //Second upload
        var logoUrlEntreprise = new FileUploadWithPreview('logoUrlEntreprise')
    </script>
    <!-- END PAGE LEVEL SCRIPTS -->
    
    <!-- DATATABLE -->
    <script type="text/javascript">

    /*****************************************************************
    
    DÉBUT COORDONNÉES TERRA
    
    *****************************************************************/
	function saveCompany() {
    	
    	var idShow = $("#logoUrlEntreprise").val();
    	console.log("Save company")
    	console.log("logoUrlEntreprise : " + idShow );
    	
    	var fd = new FormData();
        var files = $('#logoUrlEntreprise')[0].files;
        
        // Check file selected or not
        if(files.length > 0 ){
        	
           	fd.append('file',files[0]);
           	
	        $.ajax({
	        	url: "rest/coordonneesTerra/update/?ts=" + new Date().getTime(),
	        	type: "POST",
	        	headers: {'Content-Type': 'application/x-www-form-urlencoded'},
	        	data: {
	        		fd,
	        		id: 1,
	        		nom: "'" + $("#nomEntreprise").val() + "'", 
	        		adresse: "'" + $("#adresseEntreprise").val() + "'",
	        		tel: "'" + $("#telEntreprise").val() + "'",
	        		mail: "'" + $("#mailEntreprise").val() + "'",
	        		logoURL: "'" + $("#logoUrlEntreprise").val() + "'"
	        		/* logoUrlEntreprise */
	        	},
	       		contentType: false,
	           	processData: false,
	        	/*
	        	contentType: "application/json; charset=utf-8",
	            dataType: "json" 
	            */
	            success: function( msg ) {
	            	console.log("Success !")
	            	console.log( msg );
	    			$("#coordonneesTerraMiseAJour").html(msg);
	            },
	    		error:function( xhr, message, ex ){
	    			console.log("Insuccess...")
	    			$("#coordonneesTerraMiseAJour").html('<div id="alertSuccess" class="alert alert-danger text-center" role="alert">Erreur requête Ajax...</div>');
	    		}
	        } );
        } else {
           	
	        $.ajax({
	        	url: "rest/coordonneesTerra/update/?ts=" + new Date().getTime(),
	        	type: "POST",
	        	headers: {'Content-Type': 'application/x-www-form-urlencoded'},
	        	data: {
	        		id: 1,
	        		nom: "'" + $("#nomEntreprise").val() + "'", 
	        		adresse: "'" + $("#adresseEntreprise").val() + "'",
	        		tel: "'" + $("#telEntreprise").val() + "'",
	        		mail: "'" + $("#mailEntreprise").val() + "'",
	        		logoURL: "'" + $("#logoUrlEntreprise").val() + "'"
	        	},
	        	/*
	        	contentType: "application/json; charset=utf-8",
	            dataType: "json" 
	            */
	            success: function( msg ) {
	            	console.log("Success !")
	            	console.log( msg );
	    			$("#coordonneesTerraMiseAJour").html(msg);
	            },
	    		error:function( xhr, message, ex ){
	    			console.log("Insuccess...")
	    			$("#coordonneesTerraMiseAJour").html('<div id="alertSuccess" class="alert alert-danger text-center" role="alert">Erreur requête Ajax...</div>');
	    		}
	        } );
        	
        }
        $("#alertSuccess").remove();
    };
    
	/*****************************************************************
    
    DÉBUT PRIX ABONNEMENTS
    
    *****************************************************************/
	function saveAbonnement(id) {
		console.log(id);
		$.ajax({
        	url: "rest/offres/update/?ts=" + new Date().getTime(),
        	type: "POST",
        	headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        	data: {
        		id: id,
        		prixAbonnement: $("#prixAbonnement" + id).val()
        	},
        	/*
        	contentType: "application/json; charset=utf-8",
            dataType: "json" 
            */
            success: function( msg ) {
            	console.log("Success !")
            	console.log( msg );
    			$("#abonnementAlert").html(msg);
            },
    		error:function( xhr, message, ex ){
    			console.log("Insuccess...")
    			$("#abonnementAlert").html('<div id="alertSuccess" class="alert alert-danger text-center" role="alert">Erreur requête Ajax...</div>');
    		}
        } );
	
	}
    /*****************************************************************
      
     DÉBUT SLIDER
     
     *****************************************************************/
    function setModalSlide(o) {
    	/* console.log( o ); */
    	
		$("#titleModal").text( o.id );
		$("#idSlideHidden").val( o.id );
		
		$("#imageSlideModal").attr('src', o.imageURL );
		$("#titreSlideModal").val( o.titre );
		$("#titreBoutonSlideModal").val( o.titreBouton );
		$("#urlBoutonSlideModal").val( o.urlBouton );
		$("#descriptionSlideModal").text( o.description );
		
    }
    
    function clearModalSlide() {
    	
    	$("#titleModal").text( "" );
		$("#idSlideHidden").val( "" );
		
		$("#imageSlideModal").attr('src', "" );
		$("#titreSlideModal").val( "" );
		$("#titreBoutonSlideModal").val( "" );
		$("#urlBoutonSlideModal").val( "" );
		$("#descriptionSlideModal").text( "" );
		
    }
    
    function showVirginModalSlide() {
    	clearModalSlide();
    	$("#alertSuccess").remove();
    	$("#sliderModal").modal();
    };
    
    function showModalSlide(n) {
        /* alert(n); */
        /* $("#alertSuccess").remove(); */
        clearModalSlide();
        $.ajax( { /* récupérer la méthode AJAX */
    		url : "rest/slider/get/" + n + "?ts=" + new Date().getTime(), // éviter de récupérer des infos du cache grâce à une URL unique
    		dataType: "json",
    		success: function( o ) {
    			/* console.log( o ); */
    			/* clearModalSlide(); */
    			setModalSlide(o);
    			/* 
    			$("#sliderModal").modal();
    			$("#alertSuccess").remove();
    			 */
    		},
    		error:function( xhr, message, ex ){
    			$( "body" ).alert( "Erreur requête Ajax..." );
    			$( "slideAlertMiseAJour" ).html('<div id="alertSuccess" class="alert alert-danger text-center" role="alert">Erreur requête Ajax...</div>');
    			console.log( message );
    		}
    	} );
        //clearModalSlide();
		/* 
		*/
		$("#sliderModal").modal();
		
		
		$("#alertSuccess").remove(); 
		
    };
   	
    /* function saveSlider(isArchived) {
    	
    	var idShow = $("#idSlideHidden").val();
    	
    	console.log( isArchived );
        $.ajax({
        	url: "rest/client/update/?ts=" + new Date().getTime(),
        	type: "POST",
        	headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        	data: {
        		id: idShow,
        		civilite: $("#titleModal").val(),
        		nom: "'" + $("#imageSlideModal").val() + "'", 
        		prenom: "'" + $("#prenomClient").val() + "'",
        		tel: "'" + $("#titreSlideModal").val() + "'",
        		mail: "'" + $("#titreBoutonSlideModal").val() + "'",
        		abonnement: $("#abonnementModal").val(),
        		paiement: $("#paiementModal").val(),
        		secu: $("#secuModal").val(),
        		commentaire: "'" + $("#descriptionSlideModal").val() + "'",
        		archiver: isArchived
        		
        		$("#titleModal").text( o.id );
    		$("#idSlideHidden").val( o.id );
    		
    		$("#imageSlideModal").attr('src', o.imageURL );
    		$("#titreSlideModal").val( o.titre );
    		$("#titreBoutonSlideModal").val( o.titreBouton );
    		$("#urlBoutonSlideModal").val( o.urlBouton );
    		$("#descriptionSlideModal").text( o.description );
        	}, */
        	/*
        	contentType: "application/json; charset=utf-8",
            dataType: "json" 
            */
            /* success: function( o ) {
            	console.log( o );
    			$("#slideAlertMiseAJour").html(o);
            },
    		error:function( xhr, message, ex ){
    			$("#slideAlertMiseAJour").html('<div id="alertSuccess" class="alert alert-danger text-center" role="alert">Erreur requête Ajax...</div>');
    			console.log( message );
    		}
        } );
        $("#alertSuccess").remove();
    }; */
   /*
    * FIN SLIDER
    */

    /*****************************************************************
     
     DÉBUT TEMOIGNAGES
     
     ******************************************************************/
     function showModalTemoignages(n) {
         /* alert(n); */
         /* $("#alertSuccess").remove(); */
         clearModalTemoignages();
         $.ajax( { /* récupérer la méthode AJAX */
     		url : "rest/livreDOr/get/" + n + "?ts=" + new Date().getTime(), // éviter de récupérer des infos du cache grâce à une URL unique
     		dataType: "json",
     		success: function( o ) {
     			/* console.log( o ); */
     			/* clearModalSlide(); */
     			setModalTemoignages(o);
     			/* 
     			$("#sliderModal").modal();
     			$("#alertSuccess").remove();
     			 */
     		},
     		error:function( xhr, message, ex ){
     			$( "body" ).alert( "Erreur requête Ajax..." );
     			$( "slideAlertMiseAJour" ).html('<div id="alertSuccess" class="alert alert-danger text-center" role="alert">Erreur requête Ajax...</div>');
     			console.log( message );
     		}
     	} );
         //clearModalSlide();
 		/* 
 		*/
 		$("#temoignagesModal").modal();
 		
 		
 		$("#alertSuccess").remove(); 
 		
     };
     
     function clearModalTemoignages() {
     	
     	$("#titleModalTemoignages").text( "" );
 		$("#idTemoignagesHidden").val( "" );
 		
 		$("#photoTemoignagesModal").attr('src', "" );
 		$("#nomTemoignagesModal").val( "" );
 		$("#titreBoutonSlideModal").val( "" );
 		$("#urlBoutonSlideModal").val( "" );
 		$("#descriptionSlideModal").text( "" );
 		
     }
     
     function setModalTemoignages(o) {
     	console.log( o );
     	
 		$("#titleModalTemoignages").text( o.id );
 		$("#idTemoignagesHidden").val( o.id );
 		
 		$("#photoTemoignagesModal").attr('src', o.photo );
 		$("#nomTemoignagesModal").val( o.nom );
 		$("#posteTemoignagesModal").val( o.fonction );
 		$("#dateTemoignagesModal").val( o.dateCommentaire );
 		$("#commentaireTemoignagesModal").text( o.commentaire );
 		
     }
    
	/*****************************************************************
     
     DÉBUT LOGOS PARTENAIRES
     
     ******************************************************************/
     function showModalLogosPartenaires(n) {
         /* alert(n); */
         /* $("#alertSuccess").remove(); */
         clearModalLogosPartenaires();
         $.ajax( { /* récupérer la méthode AJAX */
     		url : "rest/livreDOrLogos/get/" + n + "?ts=" + new Date().getTime(), // éviter de récupérer des infos du cache grâce à une URL unique
     		dataType: "json",
     		success: function( o ) {
     			/* console.log( o ); */
     			/* clearModalSlide(); */
     			setModalLogosPartenaires(o);
     			/* 
     			$("#sliderModal").modal();
     			$("#alertSuccess").remove();
     			 */
     		},
     		error:function( xhr, message, ex ){
     			$( "body" ).alert( "Erreur requête Ajax..." );
     			$( "slideAlertMiseAJour" ).html('<div id="alertSuccess" class="alert alert-danger text-center" role="alert">Erreur requête Ajax...</div>');
     			console.log( message );
     		}
     	} );
         //clearModalSlide();
 		/* 
 		*/
 		$("#logosPartenairesModal").modal();
 		
 		
 		$("#alertSuccess").remove(); 
 		
     };
     
     function clearModalLogosPartenaires() {
     	
     	$("#titleModalLogosPartenaires").text( "" );
 		$("#idLogosPartenairesHidden").val( "" );
 		
 		$("#urlLogosPartenairesModal").attr('src', "" );
 		$("#societeLogosPartenairesModal").val( "" );
 		
     }
     
     function setModalLogosPartenaires(o) {
     	console.log( o );
     	
     	$("#titleModalLogosPartenaires").text( o.id );
 		$("#idLogosPartenairesHidden").val( o.id );
 		
 		$("#urlLogosPartenairesModal").attr('src', o.url );
 		$("#societeLogosPartenairesModal").val( o.societe );
 				
     }
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

    
    
    
    
    /*****************************************************************
     *****************************************************************
     *****************************************************************
     ***
     ***
     ***						DOC READY
     ***
     ***
     *****************************************************************
     *****************************************************************
     *****************************************************************/
    $(document).ready(function() {
    	
    	/*
	 	 *	PAS UTILISÉ
	 	 *	Range filtering
	 	 */
	    $('#min, #max').keyup( function() { table.draw(); } );
    	
	   /*
     	*	Update Coordonnées Terra
    	*/
		$("#mettreAJourCoordonneesTerra").click( function( event ) {
			
			saveCompany();
			
		});
	   	
	   /*
     	*	Update Offre mensuel
    	*/
		$("#mettreAJourAbonnement1").click( function( event ) {
			
			saveAbonnement(1);
			
		});
	   
	   /*
     	*	Update Offre annuel
    	*/
		$("#mettreAJourAbonnement2").click( function( event ) {
			
			saveAbonnement(2);
			
		});
    	/*
    	 *	Update or Create client
    	 */
	    $("#mettreAJourSlideModal").click( function( event ) {
			
			save(false);
			
		});
    	
    	/*
    	 *	Archiver client
    	 */
		$("#archiverSlideModal").click( function( event ) {
			
			save(true);
			
		});
	    
    	
        /*****************************************************************
        	
        DOC READY SLIDER
        	
        	COPY, CSV, EXCELL, PRINT
        	SHOW HIDE COLUMN
        	
        *****************************************************************/
        var table = $('#sliderTable > #show-hide-col').DataTable( {
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
                /* { extend: 'copy', className: 'btn btn-sm' },
                { extend: 'csv', className: 'btn btn-sm' },
                { extend: 'excel', className: 'btn btn-sm' },
                { extend: 'print', className: 'btn btn-sm' }, */
                {
                    text: 'id',
                    className: 'btn btn-primary btn-sm toggle-vis mb-1',
                    action: function(e, dt, node, config ) {
                        var column = table.column( 0 );
                        column.visible( ! column.visible() );
                    }
                },
                {
                    text: 'Image',
                    className: 'btn btn-primary btn-sm toggle-vis mb-1',
                    action: function(e, dt, node, config ) {
                        var column = table.column( 1 );
                        column.visible( ! column.visible() );
                    }
                },
                {
                    text: 'Titre',
                    className: 'btn btn-primary btn-sm toggle-vis mb-1',
                    action: function(e, dt, node, config ) {
                        var column = table.column( 2 );
                        column.visible( ! column.visible() );
                    }
                },
                {
                    text: 'Description',
                    className: 'btn btn-primary btn-sm toggle-vis mb-1',
                    action: function(e, dt, node, config ) {
                        var column = table.column( 3 );
                        column.visible( ! column.visible() );
                    }
                },
                {
                    text: 'Titre bouton',
                    className: 'btn btn-primary btn-sm toggle-vis mb-1',
                    action: function(e, dt, node, config ) {
                        var column = table.column( 4 );
                        column.visible( ! column.visible() );
                    }
                },
                {
                    text: 'URL bouton',
                    className: 'btn btn-primary btn-sm toggle-vis mb-1',
                    action: function(e, dt, node, config ) {
                        var column = table.column( 5 );
                        column.visible( ! column.visible() );
                    }
                },
                {
                    text: 'Archiver',
                    className: 'btn btn-primary btn-sm toggle-vis mb-1',
                    action: function(e, dt, node, config ) {
                        var column = table.column( 6 );
                        column.visible( ! column.visible() );
                    }
                },
            ]
        } );
    	
        /*****************************************************************
        
        DOC READY TEMOIGNAGE
	    	
	    	NO : COPY, CSV, EXCELL, PRINT
	    	NO : SHOW HIDE COLUMN
	    	
	    *****************************************************************/
	    var tableTemoignage = $('#temoignageTable > #zero-config').DataTable( {
	    	"dom": "<'dt--top-section'<'row'<'col-12 col-sm-6 d-flex justify-content-sm-start justify-content-center'l><'col-12 col-sm-6 d-flex justify-content-sm-end justify-content-center mt-sm-0 mt-3'f>>>" +
	        "<'table-responsive'tr>" +
	        "<'dt--bottom-section d-sm-flex justify-content-sm-between text-center'<'dt--pages-count  mb-sm-0 mb-3'i><'dt--pagination'p>>",
	            "oLanguage": {
	                "oPaginate": { "sPrevious": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>', "sNext": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>' },
	                "sInfo": "Showing page _PAGE_ of _PAGES_",
	                "sSearch": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>',
	                "sSearchPlaceholder": "Search...",
	               "sLengthMenu": "Results :  _MENU_",
	            },
	            "stripeClasses": [],
	            "lengthMenu": [5, 10, 20, 50],
	            "pageLength": 5 
	        /* 
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
	        "lengthMenu": [5, 10, 20, 50],
	        "pageLength": 5,
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
	                text: 'Photo',
	                className: 'btn btn-primary btn-sm toggle-vis mb-1',
	                action: function(e, dt, node, config ) {
	                    var column = table.column( 1 );
	                    column.visible( ! column.visible() );
	                }
	            },
	            {
	                text: 'Nom',
	                className: 'btn btn-primary btn-sm toggle-vis mb-1',
	                action: function(e, dt, node, config ) {
	                    var column = table.column( 2 );
	                    column.visible( ! column.visible() );
	                }
	            },
	            {
	                text: 'Poste',
	                className: 'btn btn-primary btn-sm toggle-vis mb-1',
	                action: function(e, dt, node, config ) {
	                    var column = table.column( 3 );
	                    column.visible( ! column.visible() );
	                }
	            },
	            {
	                text: 'Commentaire',
	                className: 'btn btn-primary btn-sm toggle-vis mb-1',
	                action: function(e, dt, node, config ) {
	                    var column = table.column( 4 );
	                    column.visible( ! column.visible() );
	                }
	            },
	            {
	                text: 'Date commentaire',
	                className: 'btn btn-primary btn-sm toggle-vis mb-1',
	                action: function(e, dt, node, config ) {
	                    var column = table.column( 5 );
	                    column.visible( ! column.visible() );
	                }
	            },
	            {
	                text: 'Archiver',
	                className: 'btn btn-primary btn-sm toggle-vis mb-1',
	                action: function(e, dt, node, config ) {
	                    var column = table.column( 6 );
	                    column.visible( ! column.visible() );
	                }
	            },
	        ]
	        */
	    } );
        
	    /****************************************************************
	    	
	    	
	    DOC READY LOGOS PARTENAIRES
	    	
	    	
	    *****************************************************************/ 
        
        c3 = $('#style-3').DataTable({
            "dom": "<'dt--top-section'<'row'<'col-12 col-sm-6 d-flex justify-content-sm-start justify-content-center'l><'col-12 col-sm-6 d-flex justify-content-sm-end justify-content-center mt-sm-0 mt-3'f>>>" +
        "<'table-responsive'tr>" +
        "<'dt--bottom-section d-sm-flex justify-content-sm-between text-center'<'dt--pages-count  mb-sm-0 mb-3'i><'dt--pagination'p>>",
            "oLanguage": {
                "oPaginate": { "sPrevious": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>', "sNext": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>' },
                "sInfo": "Showing page _PAGE_ of _PAGES_",
                "sSearch": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>',
                "sSearchPlaceholder": "Search...",
               "sLengthMenu": "Results :  _MENU_",
            },
            "stripeClasses": [],
            "lengthMenu": [5, 10, 20, 50],
            "pageLength": 5
        });

        multiCheck(c3);
        
    	/*
    		HOVER : griser la ligne au passage de la souris
    	*/
        /* var table = $('#show-hide-col').DataTable(); */
        
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