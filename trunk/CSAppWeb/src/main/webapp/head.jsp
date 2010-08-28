<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page import="cs.define.Define"%>

<head>
	<title>Car sharing</title>
	<script type="text/javascript">
		var WEB_ROOT_URL = "<%=Define.webRootUrl %>";
		var WEB_USE_LANGUAGE = "<s:property value="language"/>";
	</script>
	<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
	
	<script type="text/javascript" src="js/jquery.ui/jquery.ui.core.js"></script>
	
	<script type="text/javascript" src="js/jquery.ui/jquery.ui.widget.js"></script>

 	<script type="text/javascript" src="js/jquery.ui/jquery.ui.accordion.js"></script>
   
 	<script type="text/javascript" src="js/jquery.ui/jquery.ui.tabs.js"></script>
 
 	<script type="text/javascript" src="js/jquery.ui/jquery.validate.js"></script>
  	
	<script type="text/javascript" src="js/jquery.ui/jquery.ui.datepicker.js"></script>
	
	<script type="text/javascript" src="js/jquery.corner.js"></script>
	
	<script type="text/javascript" src="js/jquery.evenment.js"></script>
	<script type="text/javascript" src="js/jquery.evenment.onload.js"></script>

	<script type="text/javascript" src="js/googleMapAddressByPosition.js"></script>	
	<script type="text/javascript" src="js/googlemap.js"></script>
    
	<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&language=<s:property value="language"/>"></script>
 
  	<script type="text/javascript" src="js/jquery.time/jquery.utils.js"></script>
	<script type="text/javascript" src="js/jquery.time/jquery.strings.js"></script>
	
	<script type="text/javascript" src="js/jquery.time/jquery.anchorHandler.js"></script>
	  <!-- 
   	<script type="text/javascript" src="js/jquery.time/jquery.ui.all.js"></script>
 	-->
	<script type="text/javascript" src="js/jquery.time/ui.timepickr.js"></script> 
 	
 	<!--
 	<script type="text/javascript" src="js/js.accordion.js"></script>
 	-->
	<!--
	<link type="text/css" href="css/jquery.tabs.css" rel="stylesheet" >
	-->
	<link type="text/css" href="css/themes/base/jquery.ui.all.css" rel="stylesheet" >
	<!-- 
	<link type="text/css" href="css/css.css" rel="stylesheet" >
	 -->
	<link type="text/css" href="css/ui.timepickr.css" rel="stylesheet" >
	<link type="text/css" href="css/accordion.css" rel="stylesheet">
	
	<style type="text/css">
		.body{
			min-height:300px;
		}
		.left{
			height:100%;
		}
		.corner {
			background-color:#DDE8E6;
		}
	</style>
	
	<script type="text/javascript">
    	$(function(){
	      //$('#hours').timepickr();
	    });
		$(document).ready( function () { 
			$('#containerLeft').tabs({ fxFade: true, fxSpeed: 'normal' });
		} ) ;
		
		$(document).ready( function () {
			$('#menuMessages').tabs({ fxFade: true, fxSpeed: 'normal' });
			$('#menuTrip').tabs({ fxFade: true, fxSpeed: 'normal' });
			$(".corner").corner();
		} ) ;
	</script>	
	<script type="text/javascript">
		$(document).ready( function () {
			
			//Sous menu de mes offres
			$('#menuTrip').tabs({
		        select: function(e, ui) {
		        	//Mes offres poster
					if ( ui.index == 0 )
		        	{
			        	$('#myPostOffer').empty();
			        	$('#myAgreeOffer').empty();
			        	
						$('#divWaitingMyPostOffer').css('display','block');
						$.ajax({
			                method: 'post',
			                url: WEB_ROOT_URL+'CSAppWeb/MyPostOffer',
			                success: function(data)
			                {
				                 $('#myPostOffer').html(data);
				                 $('#divWaitingMyPostOffer').css('display','none');
			                }
			        	});
		        	}
		        	//Mes offres accepter
					if ( ui.index == 1 )
		        	{
			        	$('#myPostOffer').empty();
			        	$('#myAgreeOffer').empty();

			        	$('#divWaitingMmAgreeOffer').css('display','block'); 
			        	$.ajax({
			                method: 'post',
			                url: WEB_ROOT_URL+'CSAppWeb/MyPostAgree',
			                success: function(data)
			                {
				                 $('#myAgreeOffer').html(data);
				                 $('#divWaitingMmAgreeOffer').css('display','none'); 
			                }
			        	});
		        	}  
				}
			});
			//Sous menu des messages
			$('#menuMessages').tabs({
		        select: function(e, ui) {
				// onglet message send== ui.index == 0
		        if ( ui.index == 0)
		        {
		        	$('#divWaitingSend').css('display','block');
		        	$('#send').empty();
		        	//Requete ajax pour récuperer les messages boite de reception
			        $.ajax({
			                method: 'post',
			                url: WEB_ROOT_URL+'CSAppWeb/MessageSend',
			                success: function(data)
			                {
			                 	$('#send').html(data);		
								 $("#list1").accordion({
										collapsible: true,
										active: -1
								});
				 				$('#divWaitingSend').css('display','none');
			                }
		                  });//Fin ajax
			        }
		        	//Onglet message receive == ui.index == 0
			        if ( ui.index == 1)
			        {
			        	//Requete ajax pour récuperer les messages boite de reception
			        	$('#divWaitingReceive').css('display','block'); 
			        	$('#receive').empty();
			        	$.ajax({
			                method: 'post',
			                url: WEB_ROOT_URL+'CSAppWeb/MessageReceive',
			                success: function(data)
			                {
				                 $('#receive').html(data);

				                 $("#list2").accordion({
										collapsible: true,
										active: -1
								});
		
								//Ajoute les évement ajax au message recu
				 				ajaxSendResponse();
				 				$("#divWaitingReceive").css('display','none');
			                }
			        	});
			        }
		        }
			}
			);

			//Menu principale
			$('#container').bind('tabsshow', function(event, ui) {
				//post d'une offre
    			if (ui.panel.id == "post") {
					initializeMapEmpty('divMapStart');
					initializeMapEmpty('divMapStop');
    			}
    			//profil
    			if (ui.panel.id == "profil") {
    				initializeMapEmpty('divMapProfil');
    			}
    			//profil
    			if (ui.panel.id == "registration") {
    				initializeMapEmpty('divMapProfil');
    			}
    			//message
    			if (ui.panel.id == "message") {
					$('#send').empty();
					$('#receive').empty();
    				$('#divWaitingSend').css('display','block');
					$('#divWaitingReceive').css('display','block'); 
					//Requete ajax pour récuperer les messages boite de reception
		        	$.ajax({
		                method: 'post',
		                url: WEB_ROOT_URL+'CSAppWeb/MessageReceive',
		                success: function(data)
		                {
			                 $('#receive').html(data);

							//Execution des accordions
						    $("#list2").accordion({
								collapsible: true,
								active:-1
							});
							//Ajoute les évement ajax au message recu
			 				ajaxSendResponse();
			 				$("#divWaitingReceive").css('display','none');
		                }
		        	});//Fin du ajax MessageReceive
		        	
					 //Requete ajax pour récuperer les messages boite de reception
			        $.ajax({
			                method: 'post',
			                url: WEB_ROOT_URL+'CSAppWeb/MessageSend',
			                success: function(data)
			                {
			                 	$('#send').html(data);		
			        			$('#divWaitingSend').css('display','none');

								//Execution des accordions
							    $("#list1").accordion({
									collapsible: true,
									active:-1
								});
								
		                	}
		                  });//Fin ajax
    				}//Fin du panel message
    				
    				//My trip
			        if ( ui.panel.id == "trip")
			        {
			        	$('#myPostOffer').empty();
			        	$('#myAgreeOffer').empty();
		             	$('#divWaitingMyPostOffer').css('display','block');   
		             	$('#divWaitingMmAgreeOffer').css('display','block'); 

			        	$.ajax({
			                method: 'post',
			                url: WEB_ROOT_URL+'CSAppWeb/MyPostOffer',
			                success: function(data)
			                {
				                 $('#myPostOffer').html(data);
				                 $('#divWaitingMyPostOffer').css('display','none');
			                }
			        	});
			        	$.ajax({
			                method: 'post',
			                url: WEB_ROOT_URL+'CSAppWeb/MyPostAgree',
			                success: function(data)
			                {
				                 $('#myAgreeOffer').html(data);
				                 $('#divWaitingMmAgreeOffer').css('display','none'); 
			                }
			        	});

			        }//Fin de MY Trip
			});//Fin du menu principale
			$('#container').tabs();
				
		});//Fin du olnad
	</script>
	<script type="text/javascript">
		//calendrier
		$(function() {
			$("#datepickerPost").datepicker({	minDate: new Date(),
											showOn: 'button',
											buttonImage: WEB_ROOT_URL +'CSAppWeb/img/calendar.gif',
											buttonImageOnly: true
			});
			$("#datepickerSearch").datepicker({	minDate: new Date(),
											showOn: 'button',
											buttonImage: WEB_ROOT_URL +'CSAppWeb/img/calendar.gif',
											buttonImageOnly: true
			});
		});
	</script>
		<script type="text/javascript">
			function calculPrice(price1,price2,price3,price4,price5,price6,price7,price8,priceTotal,cityStop)
			{
				var price = 0;
				//alert($("#"+price1).val());
				if($("#"+price1).val() != "") {
					$("#"+price2).attr("disabled", false);
					price += parseFloat($("#"+price1).val());
				}

				if($("#"+price2).val() != "") {
					$("#"+price3).attr("disabled", false);
					price += parseFloat($("#"+price2).val());
				}
				
				if($("#"+price3).val() != ""){
					 $("#"+price4).attr("disabled", false);
					 price += parseFloat($("#"+price3).val());
				}
				
				if($("#"+price4).val() != ""){
					 $("#"+price5).attr("disabled", false);
					 price += parseFloat($("#"+price4).val());
				}
					 
				if($("#"+price5).val() != ""){
					 $("#"+price6).attr("disabled", false);
					 price += parseFloat($("#"+price5).val());
				}

				if($("#"+price6).val() != ""){
					 $("#"+price7).attr("disabled", false);
					 price += parseFloat($("#"+price6).val());
				}

				if($("#"+price7).val() != ""){
					 $("#"+price8).attr("disabled", false);
					 price += parseFloat($("#"+price7).val());
				}

				if($("#"+price8).val() != ""){
					 price += parseFloat($("#"+price8).val());
				}
				if($("#"+cityStop).val() != ""){
					 price += parseFloat($("#"+cityStop).val());
				}
				
				$("#"+priceTotal).val( price );
			}
		</script>
		<script type="text/javascript">
			function countNumberOfMessageNotRead()
			{
				setTimeout("countNumberOfMessageNotRead()",5000);
				ajaxNumberOfMessageNotRead();
			}
			//Exécution du controle des formulaires
			$(document).ready(function(){
				$('#checkaddress_form').validate({
					submitHandler: function(form) {
						//alert("form.submit()");
						//form.submit();
						ajaxCheckInAjax();
					}
				}
				);
				$('#search_form').validate({
					submitHandler: function(form) {
						ajaxSearch();
					}
				}
				);
				$('#post_form').validate({
					submitHandler: function(form) {
						goToEtape2OfPost();
						
					}
				});
				countNumberOfMessageNotRead();
			});
	</script>
	<style type="text/css">
		label { width: 10em; float: left; }
		label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
		p { clear: both; }
		.submit { margin-left: 12em; }
		em { font-weight: bold; padding-right: 1em; vertical-align: top; }
	</style>

	<script type="text/javascript">
		$(function() {
			$("#accordion").accordion({
				collapsible: true,
				active: 0
			});
		});		
	</script>
	<style type="text/css">
		img {
			border-width : 0;
			border : 0;
		} 
	</style>
</head> 