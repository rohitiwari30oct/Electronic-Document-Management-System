
<%@page import="edms.wsdl.Folder"%>
<%@page import="edms.core.Config"%>
<%@page import="java.util.ArrayList"%>
<%@page import="edms.core.Principal"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
	<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title> EDMS DESIGN </title>
<!-- <script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/interface/ReverseClass.js'></script>
<script type='text/javascript' src='dwr/util.js'></script> -->
<!--jQuery and jQuery UI with jQuery Chat-->
<script src="js/jquery-1.7.2.min.js" type="application/javascript" ></script>


<script type="text/javascript" src="js/jquery-ui.js"></script>
<link type="text/css" href="css/jquery.ui.chatbox.css" rel="stylesheet" />
<link type="text/css" href="css/new_icon.css" rel="stylesheet" />
<link type="text/css" href="css/buttons.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.ui.chatbox.js"></script>
<script type="text/javascript" src="js/javalargefileuploader.js"></script>

<script src="js/left_event.js" type="text/javascript"></script>
<script src="js/jquery_popup.js"></script>        
<script src="js/pdf.js"></script>        
<script src="js/pdf.worker.js"></script>            
<style type="text/css">
.my_notification {
margin: -6px 0;
background-color: #f9edbe;
border: 1px solid;
border-color: #f0c36d;
border-radius: 2px;
box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
padding: 6px 10px;
top: 35px;
position: absolute;
z-index: 999;
}
</style>

<script >

//Top
   	$(document).on("click",".right_tab",function(){
//alert("hi");
	var opend=false;
	if($(this).find('.icon_right').attr('class').indexOf('icon_right_minus')>-1)
	{
	opend=true;
	}
		  $('.content_right').css('display','none');
		  $('.icon_right').removeClass('icon_right_minus');
		  $('.icon_right').removeClass('icon_right_plus');
		  if(!opend)
		  {
			  $(this).find('.icon_right').addClass('icon_right_minus');
			  $(this).next('.content_right').css('display','block');
			  }
		  else {
			  
			  $(this).find('.icon_right').addClass('icon_right_plus');
			  $(this).next('.content_right').css('display','none');
			  }
		  return false;
	  
}
);

   	
</script>

<script type="text/javascript">
/* <![CDATA[ */
$(document).ready(function(){
	$("#tabs li").click(function() {
		//	First remove class "active" from currently active tab
		$("#tabs li").removeClass('active');

		//	Now add class "active" to the selected/clicked tab
		$(this).addClass("active");

		//	Hide all tab content
		$(".tab_content").hide();

		//	Here we get the href value of the selected tab
		var selected_tab = $(this).find("a").attr("href");

		//	Show the selected tab content
		$(selected_tab).fadeIn();

		//	At the end, we add return false so that the click on the link is not executed
		return false;
	});
	
	
	function generate(type) {
       
      
        return n;
    }
	
	
   
});
/* ]]> */
</script>
<!-- <script>
$( "#formTo" )
  .change(function () {
    var str = "";
    $( "#formTo option:selected" ).each(function() {
      str += $( this ).text();
    });
    $( "#formTo" ).attr( 'value',str );
  })
  .change();
</script> -->






<script type="text/javascript">
function authselectChange(valll){
	//$("#authorizationStep option[value='"+valll+"']").attr("selected","selected");	
	$("#authorizationStep").attr('value',valll);	

}
function appselectChange(valll){
	$("#approvalStep").attr('value',valll);	

}
function verselectChange(valll){
	$("#verificationStep").attr('value',valll);	

	}
function accselectChange(valll){
	$("#accountStep").attr('value',valll);	

	}

</script>

<script type="text/javascript">
function deleteAttachment(val){
	//alert(val.id);
	var des='#ae'+val.id;
//	alert(des);
	var vall=$(des);
//	alert(vall);
	 $.ajax({
			type : "GET",
			url : "deleteAttachment",
			data : {
				'path' : val.id,
			},
			contentType : "application/json",
			async : true,
			success : function(data1) {
				val.remove();
				vall.remove();
			}
			});
	 

		$('#attachmentID').attr("value", $('#attachmentID').val().replace(val.id+",", ''));
	 
}

</script>



<script type="text/javascript">


$(document).ready(function() {

	$(".tab_content_1").hide();
	$(".tab_content_1:first").show(); 

	$("ul.tabs li").click(function() {
		$("ul.tabs li").removeClass("active");
		$(this).addClass("active");
		$(".tab_content_1").hide();
		var activeTab = $(this).attr("rel"); 
		$("#"+activeTab).fadeIn(); 
	});
});

</script>
<!-- <script type="text/javascript" src="js/milonic_src.js"></script>
<script type="text/javascript" src="js/mmenudom.js"></script>
<script type="text/javascript" src="js/menu_data.js"></script>
<script type="text/javascript" src="js/contextmenu.js"></script> -->

<link href="css/style.css" type="text/css" rel="stylesheet"/>
<link rel="stylesheet" href="css/jquery_popup.css" />
<link rel="stylesheet" href="css/jquery_popup.css" />
<link rel="stylesheet" href="css/new_icon.css" />
<link rel="stylesheet" href="css/new_changes.css" />
<script src="js/new_chnages.js"></script>
<link rel="stylesheet" href="css/keyword.css" />
<script src="js/keyword.js"></script>
<link rel="stylesheet" href="css/right_click.css" />
<script src="js/right_click.js"></script>
<link rel="stylesheet" href="css/share_drop_down.css" />
<link rel="stylesheet" href="css/jquery-ui.css" />
<script src="js/share_drop_down.js"></script>
<script src="js/jquery.noty.packaged.js"></script>

<!-- JavaScript Includes -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>	 -->
		
		<!-- jQuery File Upload Dependencies -->
		<script src="js/jquery.knob.js"></script>
		<script src="js/jquery.ui.widget.js"></script>
		<script src="js/jquery.iframe-transport.js"></script>
		<script src="js/jquery.fileupload.js"></script>
		<!-- Our main JS file -->
		<script src="js/script.js"></script>
		
<script>
var count = 0;
var str = "";
$(document).ready(function() {
    $('.select-toggle > .space').on('click', function(event) {
		window.select_value = $(this).children('.inner_val').text();
        if (event.ctrlKey) {
            str = str + $(this).text() + ",";
				 $(this).addClass('active');
				var count_length = $(this).append('<span class="hide_this">Hi</span>');
				window.find_value = $(this).find('span').length;
				var find_get_val = $(this).children('.inner_val').html();
					$('.get_all_select').append('<div class='+ find_get_val+'>'+select_value+'</div>')
				if( find_value >=2 )
				{
					$(this).removeClass('active');
					$(this).parent().children('.get_all_select').children('.'+ select_value).addClass('new_tset');
					$(this).children('span').remove();
					select_value=select_value.trim();
					find_get_val=find_get_val.trim();
					if(select_value ==  find_get_val)
					{
						$('.'+select_value).addClass('By');
						}
					}
        }
        else {
            str = $(this).text();
		   $('div.active').removeClass('active');
		   $(this).addClass('active');
		   $('.get_all_select').children().remove();
		     $('.get_all_select').append('<div class='+ find_get_val+'>'+select_value+'</div>')
        }
		event.stopPropagation();
    });
	
	
	$('.submit').click(function(){
	  $('.get_all_select').show();
	  event.stopPropagation();
		});
		
	$("html").click(function () {
		         $('.space').removeClass('active');
                });
});
</script>


<script type="text/javascript">


//$('.web_dialog_overlay').hide();

function myFunctionl() {
   // $('.web_dialog_overlay').show();
  $('.mid_loading').css( "zIndex", 10 );
	$('.mid_loading').show();
	
}

function myStopFunction(myVar) {
   // $('.web_dialog_overlay').hide();
  
   $('.mid_loading').css( "zIndex", 0 );
	$('.mid_loading').hide();
	
	clearTimeout(myVar);
}

</script>
<script type="text/javascript">
function getActivitiDiagramsPage(){
	
	var myVar=setTimeout(myFunctionl,500);
	
	jQuery.get("header_activity", function( data ) {
		if(data=="true"){
			location.href="ajaxTrue";
		}else{
			 $( "#variedPagesHere" ).html( data );
			
        }
		});
	jQuery.get("header_activitydiagrams", function( data ) {
		if(data=="true"){
			location.href="ajaxTrue";
		}else{
			$( "#activitiForms" ).html( data );
		
			
        }
		 
		});
	myStopFunction(myVar);
}
</script>
<%
String userid=(String)request.getAttribute("userid");
%>
<script type="text/javascript">
	function getPage(requestPage) {
		var myVar=setTimeout(myFunctionl,500);
		jQuery.get(requestPage, 
			function( data ) {
			if(data=="true"){
				location.href="ajaxTrue";
			}else{
	         $( ".right" ).html( data );
	         myStopFunction(myVar);
	        }});
		
		if(requestPage!="fileSystem"){
			
			
		}else{
			$('.file_system').attr('onclick','getPage("fileSystem")');
			$('.file_system >a').html('MY DOCUMENT');
			$('.file_system >a').attr('href','');
			
			getLeftDocument();
			 myStopFunction(myVar);
		}
		
	}
</script>
 <script type="text/javascript">
	function getSubFolders(folderPath) {
		//alert(folderPath);
		
		var divFolder = folderPath.substr(6);
	     if($("#listdiv" + divFolder).css('display')=='none')
		  {
			  $("#listdiv" + divFolder).addClass('subfolder_open');
			  $("#sign" + divFolder).addClass('subfolder_minus');

	      }
		  else
		  {
			  $("#listdiv" + divFolder).removeClass('subfolder_open');
			  $("#sign" + divFolder).removeClass('subfolder_minus');
		  }
		
		//alert(folderPath);
		//alert(divFolder);
		if(document.getElementById("listdiv" + divFolder)!=null){
	 	var divContent = document.getElementById("listdiv" + divFolder).innerHTML;
		//alert(divContent);
		if(divContent){
		if (divContent.length > 30) {
		
		} else {
 
			//alert(folderPath.replace("listli","listdiv"));
		/*	var folderId = "#" + folderPath;
			alert(folderId); */
			var myVar=setTimeout(myFunctionl,500);
			$.ajax({
				type : "GET",
				url : "${pageContext.request.contextPath}/getSubFolders",
				data : {
					'path' : folderPath
				},
				success : function(data) {
					if(data=="true"){
						location.href="ajaxTrue";
					}else{
					//alert(data);
					$("#"+folderPath.replace("listli","listdiv")).html(data);
					divFolder="#listdiv" + divFolder;
					//alert(divFolder);
					$(divFolder).html(data);
					myStopFunction(myVar);
				}}
			});
		}
		}
		}
		
		}
</script>
 <script type="text/javascript">
	function getSubFoldersFromDoc(folderPath) {
	//	alert(folderPath);
		var divFolder = folderPath.substr(6);
		  $(".subfolder_open").removeClass('subfolder_open');
		  $(".subfolder_minus").removeClass('subfolder_minus');  
		   var path=divFolder.split('/');
		   var paths="";
		  for(var i=1;i<path.length;i++){
			//  alert(path[i]);
		  paths=paths+"/"+path[i];
		 // alert(paths);
		   divFolder=paths;
		   divFolder=divFolder.replace('_', 'pahlesetha');
		   divFolder=replaceAllSlash(divFolder);
		   divFolder=divFolder.replace('@','_avi');
		   divFolder=divFolder.replace('.','_');
		   divFolder=replaceAllSpace(divFolder);
		  
		 //  alert(divFolder);
	     if($("#listdiv" + divFolder).css('display')=='none')
		  {
			  $("#listdiv" + divFolder).addClass('subfolder_open');
			  $("#sign" + divFolder).addClass('subfolder_minus');

	      }
		/*   else
		  {
			  $("#listdiv" + divFolder).removeClass('subfolder_open');
			  $("#sign" + divFolder).removeClass('subfolder_minus'); 
		  } */
		
		//alert(folderPath);
		//alert(divFolder);
		if(document.getElementById("listdiv" + divFolder)!=null){
		
	 	var divContent = document.getElementById("listdiv" + divFolder).innerHTML;
	 	
		//alert(divContent);
		if(divContent){
		if (divContent.length > 30) {
		
		} else {
			//var myVar=setTimeout(myFunctionl,500);
			//alert(folderPath.replace("listli","listdiv"));
		/*	var folderId = "#" + folderPath;
			alert(folderId); */
			$.ajax({
				type : "GET",
				url : "${pageContext.request.contextPath}/getSubFolders",
				data : {
					'path' : folderPath
				},
				success : function(data) {
					if(data=="true"){
						location.href="ajaxTrue";
					}else{
					//alert(data);
					$("#"+folderPath.replace("listli","listdiv")).html(data);
					divFolder="#listdiv" + divFolder;
					//alert(divFolder);
					$(divFolder).html(data);
					//myStopFunction(myVar);
				}}
			});
		}
		//myStopFunction(myVar);
		}}
		//myStopFunction(myVar);
		}
		//myStopFunction(myVar);
		}
</script>
<script type="text/javascript">
	function getFileSystem(folderPath) {
	var breadcumPath=$('#breadcumPathHome').val();
	//alert(typeof(breadcumPath) == "undefined");
	if(typeof(breadcumPath) == "undefined")
	{	
		breadcumPath="";
	}
	var myVar=setTimeout(myFunctionl,500);
	jQuery.post("getFileSystem", 
				 {
			'path' : folderPath,
			'breadcumPath':breadcumPath
		},
	function( data ) {
			if(data=="true"){location.href="ajaxTrue";}else{
	         $( ".right" ).html( data );
	         myStopFunction(myVar);	
	        }});
	getSubFoldersFromDoc("listli"+folderPath);
	}
	function replaceAllSpace(filename){
		while(filename.indexOf(' ')>=0){
			filename=filename.replace(' ','_spc_spc_');
		}
		return filename;
	}
	function replaceAllSlash(filename){
		while(filename.indexOf('/')>=0){
			filename=filename.replace('/','_');
		}
		return filename;
	}
</script>
<script type="text/javascript">
function getLeftDocument(){
			var myVar=setTimeout(myFunctionl,500);
	 	jQuery.get("getLeftDocument", 
		function( data ) {
		if(data=="true"){location.href="ajaxTrue";}else{
        $( ".content_left_block" ).html( data );
        myStopFunction(myVar);
		}
       });
	
}

</script>




<script type="text/javascript">
	function getSharedFileSystem(folderPath) {
		var breadcumPath=$('#breadcumPath').val();
		//alert(typeof(breadcumPath) == "undefined");
		if(typeof(breadcumPath) == "undefined")
		{	
			breadcumPath="";
		}
			var myVar=setTimeout(myFunctionl,500);
		jQuery.get("getSharedFileSystem", 
				 {
			'path' : folderPath,
			'breadcumPath':breadcumPath
		},
				function( data ) {
			if(data=="true"){location.href="ajaxTrue";}else{
	         $( ".right" ).html( data );
				myStopFunction(myVar);
				

				//getSubFoldersFromDoc("listli"+folderPath);
			}
	        });
		
	}
</script>
<script type="text/javascript">
					function getFileContent(folderPath) {
						folderPath=$('#multiPath').val();
						var myVar=setTimeout(myFunctionl,500);
						location.href = "${pageContext.request.contextPath}/getFileContent?folderPath="
								+ folderPath;
						myStopFunction(myVar);
					}
				</script>
<script type="text/javascript">
					function getAttachment(folderPath) {
					//	folderPath=$('#attachmentID').val();
					//	alert(folderPath);
						var myVar=setTimeout(myFunctionl,500);


						window.open(
								"${pageContext.request.contextPath}/getAttachment?attachmentID="
								+ folderPath,
						  '_blank' // <- This is what makes it open in a new window.
						);


						
						myStopFunction(myVar);
					}
				</script>
<script type="text/javascript">
					function getLinkUrl(folderPath) {
						var myVar=setTimeout(myFunctionl,500);
						location.href = "${pageContext.request.contextPath}/getPublicDoc?filePath="
								+ folderPath;
						myStopFunction(myVar);
					}
				</script>
				
				
				
				
<script  src="js/share_js.js"></script>
 
     <style>
  #progressbar {
    margin-top: 20px;
  }
 
  .progress-label {
    font-weight: bold;
    text-shadow: 1px 1px 0 #fff;
  }
 
  .ui-dialog-titlebar-close {
    display: none;
  }
  </style>
 
 
 
 
 
 
</head>
      <body>

<div id="action_gif" class="my_notification" style="display: none;left: 45%;">
Processing Please wait...
</div>
         
         <div id="workflow_alert" class="my_notification"
		style="display: none; left: 43%;">Successfully Submitted!</div>
		
              <div class="main_div">
                        <!----// HEADER --->
                        <div class="main_header">
                                  <div class="header">
                                     <div onclick="getPage('fileSystem')" style="cursor: pointer;" class="logo_space">
                                          <!---/// LOGO --->
                                          <!-- style=" height: 65px;width: 150px;" -->
<!--                                           <img src="images/logo.png"  /> -->
                                          
                                          
                                            <img src="images/Digital Vault2.png" style="width:164px;" /> 
                                            <!---//LOGO END -->
                                     </div>
                                    <!--------// SEARCH HERE --------->
                                  <div class="search_main">  
                                      <div class="search_main_div">
                                          <div class="search_icon" onclick="searchFromTop()"> 
                                          <img src="images/search.png"> </div>
                                          <div class="serach_top" >
                                               <input type="text" id="searchFromTop"  onkeypress="return runScript11(event)" />
                                               <span><img src="images/arrow_down.png" /></span>
                                             <script type="text/javascript">
                                             function runScript11(e) {
                                            	    if (e.keyCode == 13) {
                                            	    	 searchFromTop();
                                            	        return false;
                                            	    }
                                            	}
                                             
                                             
                                                    function searchFromTop(){
                                                    	
                                                    	$('.search_box_details').css('display','none');
                                            		 var myVar=setTimeout(myFunctionl,500);
                                                    	var urltext=$('#searchFromTop').val();
                                                    	//alert(urltext);
                                                    	jQuery.get('searchDocByName', 
                                               				 	{
                                               					'name' : urltext
                                               					},
                                               				function( data ) {
                                               						if(data=="ajaxTrue"){location.href="index";}else{
                                               	         		$( ".right" ).html( data );
                                               	             myStopFunction(myVar);
                                               						}
                                               	        		});
                                                   	
                                               
                                                    }
                                                    
                                                    </script>
                                           </div>
                                          <div class="clear"></div>
                                    </div>
                                    <div class="search_box_details"> 
                          <!-------Tab Content Here -------------->
                         	<div id="tabs_wrapper">
                               <!--  <div id="tabs_container">
                                        <ul id="tabs">
                                              <li class="active"><a href="#tab1">BASIC</a></li>
                                              <li><a class="icon_accept" href="#tab2">ADVANCED</a></li>
                                              <li><a href="#tab3">RECENT SEARCH</a></li>
                                        </ul>
                               	</div> -->
                         		<div id="tabs_content_container">
                                      <div id="tab1" class="tab_content" style="display: block;"> 
                                      <!-------------// Tab Content Started Here ----------------->
                                              <ul>
                                                     <!--  <li>GROUP</li>
                                                      <li>
                                                        <select>
                                                          <option> Group 1</option>
                                                          <option> Group 2</option>
                                                          <option> Group 3</option>
                                                        </select>
                                                      </li>
                                                      <li>USER</li>
                                                      <li>
                                                        <input  type="text" />
                                                      </li> -->
                                                      <li>File or Folder Name</li>
                                                      <li>
                                                      <input  type="text" onblur="getDocsByName(this.value)"  onkeypress="return runScript1(event,this.value)"  />
                                                      <script type="text/javascript">
                                                      
                                                      function runScript1(e,docName) {
                                                  	    if (e.keyCode == '13') {
                                                  	    	finalSearch('searchDocByName,'+docName);
                                                  	        return false;
                                                  	    }
                                                  	}
                                                   
                                                      	function getDocsByName(docName){
                                                      		$('.search_icon_tab').attr('id','searchDocByName,'+docName);
                                                      		
                                                      		/* jQuery.get("searchDocByName", 
                                                   				 	{
                                                   					'name' : docName
                                                   					},
                                                   				function( data ) {
                                                   	         		$( ".right" ).html( data );
                                                   	        		}); */
                                                      	}
                                                      
                                                      </script>
                                                      </li>
                                                      <li>KEYWORDS</li>
                                                      <li>
                                                        <input  type="text" onblur="getDocsByKeyWords(this.value)"  onkeypress="return runScript2(event,this.value)"  />
                                                      <script type="text/javascript">

                                                      function runScript2(e,docName) {
                                                  	    if (e.keyCode == '13') {
                                                  	    	finalSearch('getDocsByKeyWords,'+docName);
                                                  	        return false;
                                                  	    }
                                                  	}
                                                      	function getDocsByKeyWords(docName){

                                                          
                                                      		//alert(docName);
                                                      		$('.search_icon_tab').attr('id','getDocsByKeyWords,'+docName);
                                                      	
                                                      		/* jQuery.get("getDocsByKeyWords", 
                                                   				 	{
                                                   					'name' : docName
                                                   					},
                                                   				function( data ) {
                                                   	         		$( ".right" ).html( data );
                                                   	        		}); */
                                                      		
                                                      	}
                                                      
                                                      </script>
                                                      </li>
                                                     <!--  <li>DATE</li> -->
                                                      <li></li>
                                                      <li>Show Documents of : </li>
                                                      <li>
                                                        <select onchange="getDocsByDate(this.value)"  onkeypress="return runScript3(event,this.value)" >
                                                          <option value="0">Please Select</option> 
                                                          <option value="yyyy">This Year</option>
                                                          <option value="mm">This Month</option>
                                                          <option value="dd">Today</option>
                                                          <option value="hh">Recently</option>
                                                        </select>
                                                        <script type="text/javascript">
                                                        function runScript3(e,docName) {
                                                      	    if (e.keyCode == '13') {
                                                      	    	finalSearch('getDocsByDate,'+docName);
                                                      	        return false;
                                                      	    }
                                                      	}
                                                      	function getDocsByDate(timeType){
                                                      		//alert(docName);
                                                      		$('.search_icon_tab').attr('id','getDocsByDate,'+timeType);
                                                      		/* jQuery.get("getDocsByDate", 
                                                   				 	{
                                                   					'name' : timeType
                                                   					},
                                                   				function( data ) {
                                                   	         		$( ".right" ).html( data );
                                                   	        		}); */
                                                      		
                                                      	}
                                                      
                                                      </script>
                                                      </li>
                                                      <li>
                                                        <div onclick="finalSearch(this.id)" class="search_icon_tab"> <img src="images/search.png" /> </div>
                                                    <script type="text/javascript">
                                                    function finalSearch(urltext){
                                                    	$('.search_box_details').css('display','none');
                                               			var myVar=setTimeout(myFunctionl,500);
                                                    	urltext=urltext.split(',');
                                                    	//alert(urltext[1]);
                                                    	jQuery.get(urltext[0], 
                                               				 	{
                                               					'name' : urltext[1]
                                               					},
                                               				function( data ) {
                                               						if(data=="ajaxTrue"){location.href="index";}else{
                                               							$( ".right" ).html( data );}

                                            						   myStopFunction(myVar);
                                               					});
                                                   
                                                    }
                                                    
                                                    </script>
                                                      </li>
                                              </ul>
                                      <!--------------/// Tab End Here ---------------------------> 
                                    </div>
                                      <div id="tab2" class="tab_content"> 
                                            <!-----------TABN CONTENT STARED HERE ---------------->
                                         <ul>
                                                    <li>FOLDER</li>
                                                    <li>
                                                      <input  type="text" />
                                                    </li>
                                                    <li>TYPE</li>
                                                    <li>
                                                      <input type="checkbox" />
                                                      <label>DOCUMENT</label>
                                                      <input type="checkbox" />
                                                      <label>FOLDER</label>
                                                      </li>
                                                      <div class="claer"></div>
                                                    <li>FILE TYPE</li>
                                                    <li>
                                                      <select>
                                                        <option>Select File Type</option>
                                                        <option>.PDF</option>
                                                        <option>.DOC</option>
                                                        <option>.EXE</option>
                                                        <option>.EXECl</option>
                                                      </select>
                                                    </li>
                                                    <li>NOTES</li>
                                                    <li>
                                                      <input  type="text" />
                                                    </li>
                                                    <li>
                                                      <div class="search_icon_tab"> <img src="images/search.png" /> </div>
                                                    </li>
                                        </ul>
                                            <!------------TAB CONTENT END HERE ----------------------> 
                              </div>
                                       <div id="tab3" class="tab_content">
                                <p>Suspendisse blandit velit eget erat suscipit in malesuada odio venenatis.</p>
                              </div>
                        </div>
        </div>
        <!------------------Tab Content End Here ------------------> 
      </div>
                                     <div class="clear"></div>
                                  </div>
                                       <%
                                            	  String username=(String)request.getAttribute("userid");
                                              Principal principal=(Principal)request.getAttribute("principal");
                                              %>
                                    
                                    <!---------/// SEARCH END HERE ---------->
                                     <a href="<spring:url value='/logout' /> "> 
                                     <div class="user_deatils">
                                         
                                    <div class="user_images"> </div>
                                    
                                       <div class="claer"></div>
                                  </div></a>
                                  <!----------/// TOP PROFILE END HERE ------------->
                                  <!---------/// SEARCH PANNEL STARTED HERE ---------->
                                  
      								<!-------------/// HEADER MENU SECTON END HERE -----------------> 
                          </div>
                                  <!-----------/// SEARCH PANNEL END HERE ------->
                                  <!--------/// MENU STARTED HERE -------->
                                  <!----------/// MENU STARTED HERE ------------>
                                   
                                  <!------------// MENU END HERE ---------->
                         <!-------/// SEARCH BOX PANNEL STARTED HERE ----------->
                        </div>
                       <!--  <div class="menu_right">
                                        <ul>
                                                 <li data-tooltip="Home">
                                                    <a href="javascript:void(0);" id="fileSystem"  onclick="getPage(this.id)"><div class="home"></div> Home<div class="claer"></div></a> 
                                                 </li>
                                                 <li data-tooltip="Download"> 
                                                    <a href="javascript:void(0);"><div class="download"></div>Download</a>
                                                 </li>
                                                 <li class="add_folder " data-tooltip="Create"> 
                                                    <a href="javascript:void(0);"><div class="create"></div> CREATE</a> 
                                                 </li>
                                                 <li class="folder_icon_1" data-tooltip="Upload"> 
                                                    <a href="javascript:void(0);"><div class="upload"></div>UPLOAD</a>
                                                 </li>
                                                 <li > 
                                                    <a href="javascript:void(0);" title="Create"><div class="create_doc"></div>CREATE</a>
                                                 </li>
                                                 <li data-tooltip="Rename" > 
                                                   <a href="javascript:void(0);"class="renameFolder"><div class="edit"></div>Rename</a> 
                                                 </li>
                                                 <li class="share" data-tooltip="Share"> 
                                                   <a href="javascript:void(0);"><div class="update"></div>SHARE</a> 
                                                 </li>
                                                <li class="delete_folder"  data-tooltip="Delete"> 
                                                   <a href="javascript:void(0);" title="Delete"><div class="delet"></div>DELETE</a> 
                                                </li>
                                                <li rel="tab22" data-tooltip="User Statistics">
                                                    <a href="javascript:void(0);" id='userStatistics' onclick="getPage(this.id)"><div class="graph_user_1"></div>STATISTICS</a>
                                                </li>
                                                <li data-tooltip="Calender" >
                                                   <a href="javascript:void(0);" id='calender'onclick="getPage(this.id)"><div class="calender_user_1" ></div>CALENDAR</a>
                                                </li>
                                                <li data-tooltip="Activity">
                                                   <a href='#' onclick="getActivitiDiagramsPage()"><div class="contact_user_1"></div>ACTIVITY</a>
                                                </li>
                                                <li data-tooltip="Shared with me">
                                                   <a href="javascript:void(0);" id='shared' onclick="getPage(this.id)"><div class="create_view"></div>SHARED</a>
                                                </li>
                                                <li data-tooltip="Recently Modified Documents">
                                                   <a href="javascript:void(0);" id='recently' onclick="getPage(this.id)"><div class="recent_open"></div>RECENTLY</a>
                                                </li>
                                                <li data-tooltip="Trash" >
                                                   <a href="javascript:void(0);" id='trash'onclick="getPage(this.id)"><div class="my_doc"></div>RECYCLE</a>
                                                </li>
                                      </ul>
                                   </div> -->
                        <!---/// HEADER END -->
           
          
           

<%-- 	<form class="form" action="#" id="contact">
		<h3>Add New Documents</h3>
		<p>
			File Name: <span>*</span>
		</p>
		<input type="file" class="custom-file-input attachment_file" id='file_browse' name="filedata" multiple />
		<div class="claer"></div>
		<input type="checkbox" class="form_bottom_space" /><label>Notify
			to users</label>
		<div class="clear"></div>
		<input type="button" id="send" value="Add" /> <input type="button"
			id="cancel" value="Cancel" /> <br />
	</form> 
</div>--%>
<!-----------------/// ADD GROUP POP UP  END HERE ---------->

<!---------// SHARING PAGES STARTED---------->
<div class="sharing_mange">
<jsp:include page="sharingPopup.jsp" />
</div>   
                 
</div>



<%-- <div class="sharing_mange">
   <h1>Sharing and Security <div class="mange_can_top">X</div></h1>
   <div class="table_append">
                   <table class="append_tr">
                       <tr class="share_bottom">
                           <td colspan="2">Invite people:</td>
                       </tr>
                       <tr>
                           <td><input type="text"  class="initive_people userforshare"  /></td>
                           <td>
                                      <div style="float: left;">
                                           <select style="width: 100px;height: 28px;" class="permissionsforshare">
                                               <option value="ur">Can View </option>
                                               <option value="uw">Can Edit </option>
                                               <option value="us">Can Manage </option>
                                           </select>
                                      </div>
                                      
                                     
                          </td>
                       </tr>
                   </table>
 <script type="text/javascript">
$(function() {
 window.availableTags = [ <%
                  String userslist="";
                     ArrayList<String> userlist=(ArrayList<String>)request.getAttribute("userlist");
                   for(String str:userlist){
                	   if(!username.equals(str)){
                	%>   <%="'"+str+"',"%>
                   <%}}
                     %>];

$( ".userforshare" ).autocomplete({
source: availableTags
});
});
</script>  
                   <div class="clear"></div>
        </div>
                 <div>
                     <div class="share_right">
                               <div class="share_more">Add More</div>
                               <div class="cancel_share mange_can">Cancel</div>
                               <div class="send_share" id="shareButtonId" onclick="assignSinglePermissions('currentFolder')" >Share</div>
                     </div>
                 </div>
             <div class="clear"></div>    
</div> --%>
<div class="web_dialog_overlay" ></div>
<div class="mid_loading" > <!-- <img src="images/loading2.gif" /> -->
<span style="color:#f00;">Loading Please wait...</span>
</div>
<!---------// SHARING PAGES END---------->
<!-- assiging permissions using new view -->
<script type="text/javascript">
	function assignSinglePermissions(doctype) {
		
		$('.sharing_mange').hide();
	    $('.web_dialog_overlay').hide();
		var count=0;
		
		
		var myVar=setTimeout(myFunctionl,500);
		var userss="";
		var valuess="";
		
		$(".userforshare").each(function() {
			count++;
			var counter=0;
			var userforshare=$(this).val();
			$(".permissionsforshare").each(function() {
				counter++;
				if(count==counter){
				var permissionforshare=$(this).val();
		    	var values=userforshare+","+permissionforshare;
				var vale = values;
				var valu = vale.split(",");
				var user = "";
				vale = valu[1];
				user = valu[0];
				
				var sourcePaths=$('#multiPath').val();
				docPath1=sourcePaths;
				
				//alert(docPath1);
				value = valu[1];
			//	alert("user = "+user+"  value = "+value);
			if(user!=""){
				userss+=user+",";
				valuess+=value+",";
				}
			}
			});
		});
		//alert(userss);
		$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/assignSinglePermission",
			data : {
				'user' : userss,
				'value' : valuess,
				'doctype' : doctype,
				'multipath':docPath1,
			},
			contentType : "application/json",
			async : true,
			success : function(data) {
				if(data=="true"){location.href="ajaxTrue";}else{
					showMsg("success","Shared Successfully");

					myStopFunction(myVar);
					
				}
			}
		}); 

	}
	
	function showMsg(type,msg){
		 var n = noty({
	            text        : msg,
	            type        : type,
	            dismissQueue: false,
	            layout      : 'topCenter',
	            theme       : 'defaultTheme'
	        });
		
		
		     	var success = n;
		     //	$.noty.setText(success.options.id, ''); // same as alert.setText('Text Override')
		     	setTimeout(function () {
		     	           $.noty.close(success.options.id);
		     	       }, 6000);   
	}
	
	function showMsgWF(msg){
		$("#workflow_alert").html(msg);
		$("#workflow_alert").show();
		     //	$.noty.setText(success.options.id, ''); // same as alert.setText('Text Override')
		     	setTimeout(function () {
		     		$("#workflow_alert").hide();
		     	       }, 3000);   
	}
</script>



<!-- 
<script type="text/javascript">
function getDocProperties(folderPath) {
	
	
	
	
		$('.sharing_mange').hide();
	    $('.web_dialog_overlay').hide();
		var count=0;
		var myVar=setTimeout(myFunctionl,500);
		
		
		
		
		
				$.ajax({
					type : "GET",
					url : "${pageContext.request.contextPath}/assignSinglePermission",
					data : {
						'user' : user,
						'value' : value,
						'doctype' : doctype,
						'folderPath':docPath1,
					},
					contentType : "application/json",
					async : true,
					success : function(data) {
						if(data=="true"){
							location.href="ajaxTrue";
							}else{
							myStopFunction(myVar);
							alert("Shared Successfully");
						}
					}
				}); 
	}
</script> -->
<script type="text/javascript">
	function getDocProperties(folderPath) {
		$('#rerename').attr('onclick','renameFolder()');
			var myVar=setTimeout(myFunctionl,500);
		$('#oldFolderName').val(folderPath);
		$('#newFolderName').val(folderPath.substring(folderPath.lastIndexOf("/")+1));
		$('#shareButtonId').attr('onclick','assignSinglePermissions("currentFolder")');
		jQuery.post("setCurrentFolder", {
			'path' : folderPath
		}, function(data) {
			if(data=="true"){location.href="ajaxTrue";}else{}
		});
		jQuery.get("getDocProperties", {
			'path' : folderPath
		}, function(data) {
			if(data=="true"){location.href="ajaxTrue";}else{
			$(".right_icon_main").html(data);
			 myStopFunction(myVar);
			}
		});
	}
</script>
<script type="text/javascript">
	function getFileProperties(folderPath) {
		$('#rerename').attr('onclick','renameFile()');
		$('#oldFolderName').val(folderPath);
		//alert(folderPath.lastIndexOf('/'));
	//	alert("sdf");
		$('#newFolderName').attr('value',folderPath.substring(folderPath.lastIndexOf("/")+1,folderPath.lastIndexOf(".")));
		$('#shareButtonId').attr('onclick','assignSinglePermissions("currentFile")');
		//alert($('#newFolderName').val());
			var myVar=setTimeout(myFunctionl,500);
		jQuery.post("setCurrentFile", {
			'path' : folderPath
		}, function(data) {
			if(data=="true"){location.href="ajaxTrue";}else{}
		});
		//	alert(folderPath);
		/* 	$.ajax({
				type : "GET",
				url : "${pageContext.request.contextPath}/getFileSystem",
				data : {
					'path' : folderPath
				},
				contentType : "application/json",
				async : false,
				success : function(data) {
					$("#fileSystem").html(data);
				}
			}); */

		/*  jQuery.get("myDocument", function( data ) {
			 $( "#variedPagesHere" ).html( data );
			});  */
		jQuery.get("getFileProperties", {
			'path' : folderPath
		}, function(data) {
			if(data=="true"){location.href="ajaxTrue";}else{}
			$(".right_icon_main").html(data);
		});
			$(".downloadFolder").attr('id',folderPath);
			$(".download_right").attr('id',folderPath);
			myStopFunction(myVar);
	}
</script>
<div id="contactdiv_6">
<form:form class="uploadForm" id="upload" method="post" action="uploadDocumentByJcr"
 commandName="fileupload"
 enctype="multipart/form-data">
			<div id="drop">
			<span>	Drop Here </span>
			<div class="textClose" >
			<%-- <%
			Folder pthh=(Folder) request.getAttribute("currentFolder");
			if(pthh!=null){
			%>
			<span  onclick="getFileSystem('<%=pthh.getFolderPath() %>')" >X</span>
			<%}else{ %> --%>
			
			<span >X</span>
			<%-- <%} %> --%>
			</div>
			<a>Browse</a>
			<input type="file" name="upl" multiple />
			</div>
</form:form>
<form:form class="uploadForm1" id="upload" method="post" action="uploadDocumentByJcr" commandName="fileupload"
 enctype="multipart/form-data">
<div class="uploadMultiple"> 
			<ul>
			</ul>
			<div class="clear"></div>    
</div>
<%-- <%
Folder pthh1=(Folder) request.getAttribute("currentFolder");
if(pthh1!=null){
%>
<input type="button" class="finishUpload" value="Finish" onclick="getFileSystem('<%=pthh1.getFolderPath() %>')" />
<%}else{ %> --%>
<input type="button" class="finishUpload" value="Finish"  />
<%-- <%} %> --%>
<div class="clear"></div> 
</form:form>
</div>
	<input type="hidden" id="checkAttactmentPopup" value="tt" />
			
					
<div id="contactdiv_616">
<form:form class="uploadForm" id="upload" method="post" action="uploadAttachment"
 commandName="fileupload"
 enctype="multipart/form-data">
			<div id="drop">
			<span>	Drop Here </span>
<div class="textClose2" ><span >X</span></div>
				<a>Browse</a>
				<input type="file" name="upl" multiple />
			</div>
</form:form>
<form:form class="uploadForm1" id="upload" method="post" action="uploadAttachment" commandName="fileupload"
 enctype="multipart/form-data">
<div class="uploadMultiple"> 
			<ul>
			</ul>
			<div class="clear"></div>    
</div>
<input type="button" class="finishUpload2" value="Finish" />
<div class="clear"></div> 
</form:form>
</div>
<!---------------//// Delete USER POP UP ----------->
<div id="contactdiv_77">
	<form class="form"  action="#" id="contact">
		<h3>Confirmation</h3>
		<p class="form_bottom_space">Do you really want to delete this
			Item ?</p>
		<div class="clear"></div>
		<input type="button" id="deleteDoc" value="Delete" /> <input type="button"
			id="cancel" value="Cancel" />
	</form>
	    <script type="text/javascript">
                      $(document).ready(function() {
                    	  var folderPath="";
                      $('#deleteDoc').click(function(event) {
                    	  //alert("sdfs");
        					$("#contactdiv_77").css("display", "none");
        					var myVar=setTimeout(myFunctionl,500);
                    	  //	var docPath=document.getElementById("oldFolderName").value;
                    	  	var docPath=document.getElementById("multiPath").value;
                    	 	//alert(docPath);
                    	  $.ajax({
          					type : "GET",
          					url : "${pageContext.request.contextPath}/recycleDoc",
          					contentType : "application/json",
          					data :{
          						docPath: docPath,
          					},
          					async : true,
          					success : function(data) {
          						if(data=="true"){
          							location.href="ajaxTrue";
          						}else if(data=="false"){myStopFunction(myVar);
          						showMsg("success","removed successfully");
          						}	else{
          						
               	         			myStopFunction(myVar);
               	         			//alert(data);
               	         			
	                             //   showMsg("success",data);
               	         			var alertt=data;
	                                folderPath=$('#currentDirectory').val();
	                              //  alert(folderPath);
                        		 	var breadcumPath=$('#breadcumPathHome').val();
									//alert(typeof(breadcumPath) == "undefined");
									if(typeof(breadcumPath) == "undefined")
									{	
										breadcumPath="";
									}
									jQuery.post("getFileSystem", {
										'path' : folderPath,
										'breadcumPath':breadcumPath
                   					},
                   				function( data ) {
                   						if(data=="true"){
                   							location.href="ajaxTrue";
                   							}else{
	                   	         			$( ".right" ).html( data );
	                                    //	showMsg("success","Moved to trash.");
	                                     showMsg("success",alertt);
	                   	         			myStopFunction(myVar);
                   						}
                   	        		}); 
          							}
          						}
          				}); 
                      });
                      });
       </script>
</div>
<!-----------------/// DELETE POP UP  END HERE ---------->



<!---------------//// ADD GROUP USER POP UP ----------->

              <!-----------/// ADD KEYWORD STRED HERE ---------->
              <div class="key_word_box">
                <h1>Add Keyword</h1>
                  <!--// ADD BOX -------->
                     <div class="keyword_box">
                               <ul>
                     <li>Keyword </li>
                     <li>
                     <select style="height: 29px;width: 50%" id="add_keywordkey" onchange="keywordKeyChange(this.value)">
                     <%
                     String keywordkeys=Config.EDMS_KEYWORDKEY;
                     String[] keywordkey=keywordkeys.split(",");
                     for(int i=0;i<keywordkey.length;i++){
                     %>
                    
                     <option value="<%=keywordkey[i]%>"><%=keywordkey[i]%></option>
                     <%} %>
                       <option value="">Other</option>
                     </select>
                     <input type="text" class="keyword_name Datepicker_33"  style="display: none;;width: 40%" maxlength="75" /> 
                     <input type="text" class="keyword_name datepicker" style=";width: 40%" id="add_keywordid" maxlength="75" />
                      <input type="hidden"  id="edit_keywordid" maxlength="75" />
                      <script type="text/javascript">
                     function keywordKeyChange(keykey){
                    	 //alert(keykey);
                    	 if(keykey!="Date"){
                    		 $('.datepicker').attr("id","");
                    		 $('.Datepicker_33').attr("id","add_keywordid");
                    		 $('.datepicker').css("display","none");
                    		 $('.Datepicker_33').css("display","block");
                    	 }else{
                    		 $('.datepicker').attr("id","add_keywordid");
                    		 $('.Datepicker_33').attr("id","");
                    		 $('.datepicker').css("display","block");
                    		 $('.Datepicker_33').css("display","none");
                    	 }
                     }
                     
                     </script> 
                     </li>
                 
                  </ul>
                       <div class="keyword_text">
                       <!---// ADD --->
                       <div class="add_keyword" >Save</div>
                       <!----/// ADD -->
                       <!---// ADD --->
                       <div class="add_keyword_exit" >save and exit</div>
                       <!----/// ADD -->
                       
                       <!--// CANCEL --->
                        <div class="cancel_keyword">cancel</div>
                       <!--// CANCEL =--->
                   </div>
                   <div class="clear"></div>
                   </div>
                  <!------// ADD BOX ---->
                  <div class="clear"></div>
              </div>
               <div class="web_dialog_overlay" ></div>
              <!-----------/// ADD KEYWORD END HERE ------------------>
              <script type="text/javascript">
          	// ADD KEY WORD 
          	$(document).on("click",".add_keyword",function(){
        		var myVar=setTimeout(myFunctionl,500);
          		// var keyword = $('#add_keywordid').val();
          		// alert($('.keyword_name').val());
          		var keyword=$('#add_keywordid').val();
          		// alert($('#add_keywordkey').val());
          		if($('#add_keywordkey').val()==""){}else{
          		keyword=$('#add_keywordkey').val()+":"+$('#add_keywordid').val();
          		}
          		$.ajax({
          				type : "GET",
          				url : "${pageContext.request.contextPath}/addKeyword",
          				data : {
          					'keyword' : keyword
          				},
          				contentType : "application/json",
          				async : true,
          				success : function(data) {
          					if(data=="true"){location.href="ajaxTrue";}else{
          						

          						showMsg("success","Saved successfully");
          					}
          					//$("#folderThumbView>ul").append(data);
          					// alert(data);
          				}

          			});
          			var keywordname = $('#add_keywordid').val()
          			if($('#add_keywordid').val()=='')
          			{
          				showMsg("success",'PLease Enter the keyword !');
          				
          			} else {
          			$('.inner_keyword >ul').append('<li><span>'+ keyword +'</span><img src="images/delete_icon_file.png"><div class="clear"></div><div class="clear"></div></li>');
          		        }
          			$('#add_keywordid').val('');
          			myStopFunction(myVar);
          			});
          	$(document).on("click",".edit_keyword",function(){
        		var myVar=setTimeout(myFunctionl,500);
          		// var keyword = $('#add_keywordid').val();
          		// alert($('.keyword_name').val());
          		var keyword=$('#add_keywordid').val();
          		var editedKeyword=$('#edit_keywordid').val();
          		// alert($('#add_keywordkey').val());
          		if($('#add_keywordkey').val()==""){}else{
          		keyword=$('#add_keywordkey').val()+":"+$('#add_keywordid').val();
          		}
          		$.ajax({
          				type : "GET",
          				url : "${pageContext.request.contextPath}/editKeyword",
          				data : {
          					'keyword' : keyword,
          					'editedKeyword' : editedKeyword
          				},
          				contentType : "application/json",
          				async : true,
          				success : function(data) {
          					if(data=="true"){location.href="ajaxTrue";}else{
          						showMsg("success","Saved successfully");
          						
          					}
          					//$("#folderThumbView>ul").append(data);
          					// alert(data);
          				}

          			});
          			var keywordname = $('#add_keywordid').val()
          			if($('#add_keywordid').val()=='')
          			{
          				showMsg("success",'PLease Enter The Value !')
          				
          			} else {
          			$('.inner_keyword >ul').append('<li><span>'+ keyword +'</span><img src="images/delete_icon_file.png"><div class="clear"></div><div class="clear"></div></li>');
          		        }
          			$('#add_keywordid').val('');
          			
          			myStopFunction(myVar);
          			
          			});
          		
          		// ADD KEY WORD 
          		
          		/// SAVE AND CALCEL STRED HERE 
	$(document).on("click",".edit_keyword_exit",function(){

			$('.key_word_box').hide();
			var myVar=setTimeout(myFunctionl,500);
		 	
		 	var keyword=$('#add_keywordid').val();
      		var editedKeyword=$('#edit_keywordid').val();
      		//alert($('#add_keywordkey').val());
      		if($('#add_keywordkey').val()==""){}else{
      			
      		keyword=$('#add_keywordkey').val()+":"+$('#add_keywordid').val();
      		}
		 	
		 	
		//alert($('.keyword_name').val());
		$.ajax({
				type : "GET",
				url : "${pageContext.request.contextPath}/editKeyword",
				data : {
					'keyword' :keyword,
  					'editedKeyword' : editedKeyword
				},
				contentType : "application/json",
				async : true,
				success : function(data) {
					if(data=="true"){location.href="ajaxTrue";}else{
  						showMsg("success","Saved successfully");
						 $('.web_dialog_overlay').hide();
						myStopFunction(myVar);
						
					}
					//$("#folderThumbView>ul").append(data);
					// alert(data);
				}

			});
			var keywordname = $('#add_keywordid').val()
			if($('#add_keywordid').val()=='')
			{
				showMsg('error','PLease Enter The Value !')
				
			} else {
			$('.inner_keyword >ul').append('<li><span>'+ keyword +'</span><img src="images/delete_icon_file.png"><div class="clear"></div><div class="clear"></div></li>');
		        }
			$('#add_keywordid').val('');
			
			
			});
	$(document).on("click",".add_keyword_exit",function(){

		$('.key_word_box').hide();
		var myVar=setTimeout(myFunctionl,500);
	 	
	 	var keyword=$('#add_keywordid').val();
  		//alert($('#add_keywordkey').val());
  		if($('#add_keywordkey').val()==""){}else{
  			
  		keyword=$('#add_keywordkey').val()+":"+$('#add_keywordid').val();
  		}
	 	
	 	
	//alert($('.keyword_name').val());
	$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/addKeyword",
			data : {
				'keyword' :keyword
			},
			contentType : "application/json",
			async : true,
			success : function(data) {
				if(data=="true"){location.href="ajaxTrue";}else{
						showMsg("success","Saved successfully");
					 $('.web_dialog_overlay').hide();
					myStopFunction(myVar);
					
				}
				//$("#folderThumbView>ul").append(data);
				// alert(data);
			}

		});
		var keywordname = $('#add_keywordid').val()
		if($('#add_keywordid').val()=='')
		{
			showMsg("success",'PLease Enter The Value !')
			
		} else {
		$('.inner_keyword >ul').append('<li><span>'+ keyword +'</span><img src="images/delete_icon_file.png"><div class="clear"></div><div class="clear"></div></li>');
	        }
		$('#add_keywordid').val('');
		
		
		});
		
		/// SAVE AND CANCEL END HERE 
	
	
              </script>
                       <script >
                                         $(document).on("click",".inner_keyword >ul >li >img.keyword_del",function(){
                                        	
                                        	 $.ajax({
                                 				type : "GET",
                                 				url : "${pageContext.request.contextPath}/removeKeyword",
                                 				data : {
                                 					'keyword' : this.id
                                 				},
                                 				async : true,
                                 				success : function(data) {
                                 					if(data=="true"){
                              							location.href="ajaxTrue";
                              						}
                                 					else{

                                  						showMsg("success","Deleted successfully");
                                 					}
                                 					//$("#folderThumbView>ul").append(data);
                                 					// alert(data);
                                 				}
                                 			});
                                        	 $(this).parent().remove();
                                 			});
                                         </script>
<script type="text/javascript">
$(document).on("click",".add_note",function(){

	var myVar=setTimeout(myFunctionl,500);
 	var note=$('#notesnote').val();
	$.ajax({
		type : "GET",
		url : "${pageContext.request.contextPath}/addNotes",
		data : {
			'note' :note
		},
		contentType : "application/json",
		async : true,
		success : function(data) {
			if(data=="true"){location.href="ajaxTrue";}else{
			//	$('.notesRows').html(note +' <img src="images/cancel.png" />');
			//	$('#notesnote').val('');
          						showMsg("success","Saved successfully");
			myStopFunction(myVar);
			}
			//$("#folderThumbView>ul").append(data);
			// alert(data);
		}
	});
	
	
	});


</script>

<div class="preview_images">  
      <!-------// HEADING ------> 
       <div class="preve_heading">
             <h1>Document Preview </h1>
             <div class="close_prev">x</div>
       </div>
     <!------// HEADING END -------->
   <!----// KEEP THE INNER CONTENT ------>
   <div class="inner_prev_page">
   <img src="" alt="Please Wait..." />
    </div>
   <!-----// KEET THE INNER CONTENT ------>
  </div>
   <input type="hidden" id="cutCopyDocPath"  />

<script type="text/javascript">
$(document).on("click",".cutDocMenu",function(){
	$('#cutCopyDocPath').val($('#multiPath').val()+",cut");
});
$(document).on("click",".copyDocMenu",function(){
	$('#cutCopyDocPath').val($('#multiPath').val()+",copy");
});
function pasteDocMenu(){

  /*   $( this ).button( "option", {
      disabled: true,
      label: "Downloading..."
    }); */
  
	
	
	
	var sourcePaths=$('#cutCopyDocPath').val();
  //  alert(sourcePaths);
	var sourcePath=sourcePaths.split(',');
	var sourcePathMulti=sourcePaths.substring(0,sourcePaths.lastIndexOf(','));
	//alert(sourcePathMulti);
	var destPath=$('#oldFolderName').val();
	//var pathtohide=sourcePath[0];
	//alert($('#multiPath').val());
	if(sourcePath[0]==destPath){
		showMsg("success","source and destination can not be same");
		}else{
			//alert(sourcePath);
			if(sourcePath[(sourcePath.length-1)]=="cut"){
				var myVar=setTimeout(myFunctionl,500);
				jQuery.get("moveDoc", {
					//'sourcePath' : sourcePath[0],
					'sourcePath' : sourcePathMulti,
					'destPath': destPath,
				}, function(data) {
					if (data == "true") {
						location.href = "ajaxTrue";
					}
					else{
					var dddl=data.split(',delma,');
					
						$('#cutCopyDocPath').val('');

  						showMsg("success",dddl[1]);
					/* 	jQuery.post("getFileSystem", {
							'path' : dddl[0]
						}, function(data) {
							if (data == "true") {
								location.href = "ajaxTrue";
							}
							$(".right").html(data);
      						showMsg("success",dddl[1]);
						}); */
					}
					//$("#"+pathtohide).remove();
					//$("#"+pathtohide)
					myStopFunction(myVar);
				});
			}
			if(sourcePath[(sourcePath.length-1)]=="copy"){
				//alert("copy");
						var myVar=setTimeout(myFunctionl,500);
				jQuery.get("copyDoc", {
					//'sourcePath' : sourcePath[0],
					'sourcePath' : sourcePathMulti,
					'destPath': destPath,
				}, function(data) {
					if (data == "true") {
						location.href = "index";
					}else{
  						showMsg("success","Copied successfully");
					 	/* jQuery.post("getFileSystem", {
							'path' : data
						}, function(data) {
							if (data == "true") {
								location.href = "index";
							}
      						showMsg("success","Copied successfully");
							$(".right").html(data);
						});  */
						myStopFunction(myVar);
					}
					});
				//alert($('#cutCopyDocPath').val()+" to "+$('#oldFolderName').val());
			}
		}
		}
</script>
       <script type="text/javascript">
                         	function restoreVersion(folderPath){
                         		folderPath=folderPath.split(',');
                         		alert(folderPath[0]);
                         		  $.ajax({
                   					type : "GET",
                   					url : "${pageContext.request.contextPath}/restoreVersion",
                   					data : {
                   						'folderPath' : folderPath[0],
                             			'versionName' : folderPath[1]
                   					},
                   					contentType : "application/json",
                   					async : false,
                   					success : function(data) {
                   						if(data=="true"){
                   							location.href="index";
                   						}
                   						showMsg("success","restored successfully");
                   						//$("#folderView>.row_content>ul").append(data);
                   					}

                   				}); 
                         	
                         	}
                         
                         </script>
<!-- <div id="dialog" title="File Download">
  <div class="progress-label">Starting download...</div>
  <div id="progressbar"></div>
</div> -->

<script type="text/javascript">
function getPrevious(){
	window.open('getPreview', '_blank');
}

</script>
<!-- <button id="downloadButton">Start Download</button> -->



<script type="text/javascript">
	function printDiv() {
		$(".popupDatepicker").each(function() {
			$(this).attr("value", $(this).val());
			});
		
		var divToPrint = document.getElementById('myformPurPlant');
		var newWin = window.open('', 'Print-Window',
				'width=600,height=700,top=5,left=5,right5');
		newWin.document.open();
		var bname=navigator.userAgent;
		if(bname.indexOf("Chrome")>=0||bname.indexOf(".Net")>=0){
		newWin.document
		.write('<html><head><link rel="stylesheet" href="css/style.css" /><style>#in {display:none} body{overflow: auto;}</style><body onload="window.print()">'
				+ divToPrint.innerHTML + '</body></html>');
		}else{
		
		newWin.document
				.write('<html><head><link rel="stylesheet" href="css/style.css" /><style>#in {display:none;} .from_main_leave {width: 900px;margin:0px !important; margin-top: 21px;}  </style></head><body style="overflow-x: visible ;overflow-y: visible !important;" onload="window.print()">'
						+ divToPrint.innerHTML + '</body></html>');
		}
		newWin.document.close();
		//setTimeout(function(){newWin.close();},10);
	}
</script>


<script type="text/javascript">
	function printDivPurPlant() {

		try{
			$(".popupDatepicker").each(function() {
				$(this).attr("value", $(this).val());
				});
		}catch(er){}
		var divToPrint = document.getElementById('myformPurPlant');
		var newWin = window.open('', 'Print-Window',
				'width=600,height=700,top=5,left=1,right=1');
		newWin.document.open();
		var bname=navigator.userAgent;
		if(bname.indexOf("Chrome")>=0||bname.indexOf(".Net")>=0){
			newWin.document
			.write('<html><head><link rel="stylesheet" href="css/style.css" /><style>#in {display:none} body{overflow: auto;}</style><body onload="window.print()">'
					+ divToPrint.innerHTML + '</body></html>');
			}else{
			
			newWin.document
					.write('<html><head><link rel="stylesheet" href="css/style.css" /><style>#in {display:none;} .from_main_leave {width: 900px;margin:0px !important; margin-top: 21px;}  </style></head><body style="overflow-x: visible ;overflow-y: visible !important;" onload="window.print()">'
							+ divToPrint.innerHTML + '</body></html>');
			}
		newWin.document.close();
		//setTimeout(function(){newWin.close();},10);
	}
	
	
</script>

<script type="text/javascript">

function printDivLeave()
{

	try{
		$(".popupDatepicker").each(function() {
			$(this).attr("value", $(this).val());
			});
	}catch(er){}
var divToPrint=document.getElementById('myformLeave');
var newWin=window.open('','Print-Window','width=600,height=700,top=5,left=5,right5');
newWin.document.open();
var bname=navigator.userAgent;

if(bname.indexOf("Chrome")>=0||bname.indexOf(".Net")>=0){
newWin.document
.write('<html><head><link rel="stylesheet" href="css/style.css" /><style>#in {display:none} body{overflow: auto;}</style><body onload="window.print()">'
		+ divToPrint.innerHTML + '</body></html>');
}else{

newWin.document
		.write('<html><head><link rel="stylesheet" href="css/style.css" /><style>#in {display:none;} .from_main_leave {width: 900px;margin:0px !important; margin-top: 21px;}  </style></head><body style="overflow-x: visible ;overflow-y: visible !important;" onload="window.print()">'
				+ divToPrint.innerHTML + '</body></html>');
}
newWin.document.close();
//setTimeout(function(){newWin.close();},10);
}
</script>


<script type="text/javascript">

function printDivLeave()
{


	try{
		$(".popupDatepicker").each(function() {
			$(this).attr("value", $(this).val());
			});
	}catch(er){}

var divToPrint=document.getElementById('myformLeave');
var newWin=window.open('','Print-Window','width=600,height=700,top=5,left=5,right5');
newWin.document.open();


var bname=navigator.userAgent;
if(bname.indexOf("Chrome")>=0||bname.indexOf(".Net")>=0){
newWin.document
.write('<html><head><link rel="stylesheet" href="css/style.css" /><style>#in {display:none} body{overflow: auto;}</style><body onload="window.print()">'
		+ divToPrint.innerHTML + '</body></html>');
}else{

newWin.document
		.write('<html><head><link rel="stylesheet" href="css/style.css" /><style>#in {display:none;} .from_main_leave {width: 900px;margin:0px !important; margin-top: 21px;}  </style></head><body style="overflow-x: visible ;overflow-y: visible !important;" onload="window.print()">'
				+ divToPrint.innerHTML + '</body></html>');
}
newWin.document.close();
}


function printDivCPV()
{	
try{
	$(".popupDatepicker").each(function() {
		$(this).attr("value", $(this).val());
		});
	
	
}catch(er){}
	var divToPrint=document.getElementById('myformCPV');
var newWin=window.open('','Print-Window','width=600,height=700,top=5,left=5,right5');
newWin.document.open();

var bname=navigator.userAgent;

if(bname.indexOf("Chrome")>=0||bname.indexOf(".Net")>=0){
newWin.document
.write('<html><head><link rel="stylesheet" href="css/style.css" /><style>#in {display:none} body{overflow: auto;}</style><body onload="window.print()">'
		+ divToPrint.innerHTML + '</body></html>');
}else{

newWin.document
		.write('<html><head><link rel="stylesheet" href="css/style.css" /><style>#in {display:none;} .from_main_leave {width: 900px;margin:0px !important; margin-top: 21px;}  </style></head><body style="overflow-x: visible ;overflow-y: visible !important;" onload="window.print()">'
				+ divToPrint.innerHTML + '</body></html>');
}
newWin.document.close();
}
</script>



<script type="text/javascript">

function printDivMedi()
{

	try{
		$(".popupDatepicker").each(function() {
			$(this).attr("value", $(this).val());
			});
	}catch(er){}
var divToPrint=document.getElementById('myformMedi');
var newWin=window.open('','Print-Window','width=600,height=700,top=5,left=5,right5');
newWin.document.open();

var bname=navigator.userAgent;

if(bname.indexOf("Chrome")>=0||bname.indexOf(".Net")>=0){
newWin.document
.write('<html><head><link rel="stylesheet" href="css/style.css" /><style>#in {display:none} body{overflow: auto;}</style><body onload="window.print()">'
		+ divToPrint.innerHTML + '</body></html>');
}else{

newWin.document
		.write('<html><head><link rel="stylesheet" href="css/style.css" /><style>#in {display:none;} .from_main_leave {width: 900px;margin:0px !important; margin-top: 21px;}  </style></head><body style="overflow-x: visible ;overflow-y: visible !important;" onload="window.print()">'
				+ divToPrint.innerHTML + '</body></html>');
}
newWin.document.close();
}
</script>


<script type="text/javascript">
$(document).on("click",".set_link_give_link",function(){
	var myVar=setTimeout(myFunctionl,500);
 	var note=$('#notesnote').val();
	$.ajax({
		type : "GET",
		url : "${pageContext.request.contextPath}/setPublicLinkRequest",
		contentType : "application/json",
		async : true,
		success : function(data) {
			if(data=="true"){location.href="ajaxTrue";}else{
          					//	showMsg("success",data);
          						$("#publicLink").val(data);
          						//$(document).on("click",".set_link_give_link",function(){
          					        $("#contactdiv_getLink").css("display", "block");
          					      var $radios = $('input:radio[name=publiclinkflag]');
          					    //if($radios.is(':checked') === false) {
          					        $radios.filter('[value=1]').prop('checked', true);
          					    //}
          					   // });
          						
			myStopFunction(myVar);
			}
		
		}
	});
	});
$(document).on("click","#remove_link_give_link",function(){
	var myVar=setTimeout(myFunctionl,500);
 	var note=$('#notesnote').val();
	$.ajax({
		type : "GET",
		url : "${pageContext.request.contextPath}/removePublicLinkRequest",
		contentType : "application/json",
		async : true,
		success : function(data) {
			if(data=="true"){location.href="ajaxTrue";}else{
          					//	showMsg("success",data);
          						$("#publicLink").val(data);
          						//$(document).on("click",".set_link_give_link",function(){
          					    //    $("#contactdiv_getLink").css("display", "block");
          					   // });
			myStopFunction(myVar);
			}
		}
	});
	});
$(document).on("click","#add_link_give_link",function(){
	var myVar=setTimeout(myFunctionl,500);
 	var note=$('#notesnote').val();
	$.ajax({
		type : "GET",
		url : "${pageContext.request.contextPath}/setPublicLinkRequest",
		contentType : "application/json",
		async : true,
		success : function(data) {
			if(data=="true"){location.href="ajaxTrue";}else{
          					//	showMsg("success",data);
          						$("#publicLink").val(data);
          						//$(document).on("click",".set_link_give_link",function(){
          					    //    $("#contactdiv_getLink").css("display", "block");
          					   // });
          						
			myStopFunction(myVar);
			}
		
		}
	});
	});
</script>