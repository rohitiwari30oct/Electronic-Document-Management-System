
<%@page import="edms.core.Config"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.security.Principal"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
	<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title> EDMS DESIGN </title>

<!--jQuery and jQuery UI with jQuery Chat-->
<script src="js/jquery-1.7.2.min.js" type="application/javascript" ></script>
<!-- <script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/interface/ReverseClass.js'></script>
<script type='text/javascript' src='dwr/util.js'></script> -->

<script type="text/javascript" src="js/jquery-ui.js"></script>
<link type="text/css" href="css/jquery.ui.chatbox.css" rel="stylesheet" />
<link type="text/css" href="css/new_icon.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.ui.chatbox.js"></script>
<script type="text/javascript" src="js/javalargefileuploader.js"></script>

<script src="js/left_event.js" type="application/javascript"></script>
<script src="js/jquery_popup.js"></script>            
<style type="text/css">
.my_notification {
margin: -6px 0;
background-color: #f9edbe;
border: 1px solid;
border-color: #f0c36d;
border-radius: 2px;
box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
padding: 6px 10px;
top: 4%;
position: absolute;
z-index: 99999;
}
</style>
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
});
/* ]]> */
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

<!-- JavaScript Includes -->
	<!-- 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>	 -->
		<script src="js/jquery.knob.js"></script>

		<!-- jQuery File Upload Dependencies -->
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
		
		//var find_val = $(this).find('.active').length;
		//alert(find_val);
		
	   

	
		//  alert(count_click);
        if (event.ctrlKey) {
            str = str + $(this).text() + ",";
			
			
				 
				 $(this).addClass('active');
				var count_length = $(this).append('<span class="hide_this">Hi</span>');
				window.find_value = $(this).find('span').length;
				
			
				//find_value
				var find_get_val = $(this).children('.inner_val').html();
				//alert(find_get_val);
				
					$('.get_all_select').append('<div class='+ find_get_val+'>'+select_value+'</div>')
				
				if( find_value >=2 )
				
				{
					$(this).removeClass('active');
					$(this).parent().children('.get_all_select').children('.'+ select_value).addClass('new_tset');
					//alert($(this).parent().children('.get_all_select'));
					//alert('.'+select_value)
					$(this).children('span').remove();
					//alert(select_value);
					//alert(find_get_val);
					
					//alert('.'+select_value)
					//$(this).children('span').remove();
					select_value=select_value.trim();
					find_get_val=find_get_val.trim();
					//alert(select_value);
					//alert(find_get_val);
					if(select_value ==  find_get_val)
					{
					//	alert('Enter Test')
						$('.'+select_value).addClass('By');
					//	alert($('.Hello1'));
						//$('.get_all_select >.'+find_get_val).remove();
						
						}
					
					}
				
				 
				 
			
			// $(this).find('.active').prop('selected', isSelect)

                   
			
        }
		
        else {
            str = $(this).text();
           // alert(str);
		   $('div.active').removeClass('active');
		   $(this).addClass('active');
		   $('.get_all_select').children().remove();
		     $('.get_all_select').append('<div class='+ find_get_val+'>'+select_value+'</div>')
           // str = '';
        }
		//alert(find_value);
		event.stopPropagation();
    });
	
	
	$('.submit').click(function(){
		
			  // alert(find_get_val);
	
      //  str = ''; // after alert reset the str
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
    $('.web_dialog_overlay').show();
  $('.mid_loading').css( "zIndex", 10 );
	$('.mid_loading').show();
	
}

function myStopFunction(myVar) {
    $('.web_dialog_overlay').hide();
  
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
		   divFolder=divFolder.replace('@','_');
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
		}
		//myStopFunction(myVar);
		}}
		//myStopFunction(myVar);
		
		}
</script>
<script type="text/javascript">
	function getFileSystem(folderPath) {
	//	alert('dsf');
		var myVar=setTimeout(myFunctionl,500);
	jQuery.post("getFileSystem", 
				 {
			'path' : folderPath
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
			var myVar=setTimeout(myFunctionl,500);
		jQuery.get("getSharedFileSystem", 
				 {
			'path' : folderPath
		},
				function( data ) {
			if(data=="true"){location.href="ajaxTrue";}else{
	         $( ".right" ).html( data );
				myStopFunction(myVar);
			}
	        });
		
	}
</script>
<script type="text/javascript">
					function getFileContent(folderPath) {
						var myVar=setTimeout(myFunctionl,500);
						location.href = "${pageContext.request.contextPath}/getFileContent?folderPath="
								+ folderPath;
						myStopFunction(myVar);
					}
				</script>
<script  src="js/share_js.js"></script>
 <!-- 
  <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
       
        <script src="js/javalargefileuploader.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {

                //construct object
                jlfu = new JavaLargeFileUploader();

                //call the initializing function
                jlfu.initialize(function (pendingFiles) {

                    //iterate over all the pending files
                    for (key in pendingFiles) {
                        var pendingFile = pendingFiles[key];

                        //create a control element for each of them
                        appendUploadControls(pendingFile.id);

                        //if the file is complete
                        if (pendingFile.fileComplete) {
                            //specify it in the em element
                            document.getElementById(pendingFile.id).children[0].textContent = "The file '" + pendingFile.originalFileName + "' has been fully uploaded (" + pendingFile.fileCompletion + "/" + pendingFile.originalFileSize + ").";
                            deleteElementsButEmAndCancel(pendingFile.id);
                        }
                        //else if incomplete and pending 
                        else if (pendingFile.fileCompletion) {

                            //describe the file so that the user can select it again
                            document.getElementById(pendingFile.id).children[0].textContent = "The file '" + pendingFile.originalFileName + "' has been partially uploaded (" + pendingFile.fileCompletion + "/" + pendingFile.originalFileSize + "). Reselect it to continue uploading it or cancel it.";

                            //set progress in progress bar
                            $("#" + pendingFile.id).children(".progressbar").progressbar({
                                value: Math.floor(pendingFile.percentageCompleted)
                            });

                            //set if there is a rate configured
                            if (pendingFile.rateInKiloBytes) {
                                document.getElementById(pendingFile.id).children[2].value = pendingFile.rateInKiloBytes;
                            }

                        }

                    }

                }, function (message) {
                    alert(message);
                });

                //specify some configuration
                jlfu.setMaxNumberOfConcurrentUploads(3);
                jlfu.getErrorMessages()[9] = "More than 3 pending upload, file is queued.";

                //add a file upload element
                appendFileInputElement();

            });

            function getFileId(element) {
                return element.parentElement.id;
            }

            function appendFileInputElement() {

                //get handle to main container
                var mainContainer = document.getElementById('fileContainer');

                //hide the last children
                if (mainContainer.children.length > 0) {
                    mainContainer.children[mainContainer.children.length - 1].hidden = true;
                }

                //generate a new file input control
                var fileInput = document.createElement("input");
                fileInput.type = "file";
                fileInput.setAttribute('multiple', 'multiple');
                mainContainer.appendChild(fileInput);

                //add a listener
                fileInput.addEventListener("change", function (e) {

                    //hide the fileupload and append a new one
                    appendFileInputElement();

                    //process the file upload
                    jlfu.fileUploadProcess(e.target,

                    //define a start callback to create the UI that will interact with the file upload
                    function (pendingFile, origin) {
                        appendUploadControls(pendingFile.id);
                    },

                    //define a progressCallback to show the progress in the em elements 
                    function (pendingFile, percentageCompleted, uploadRate, estimatedRemainingTime, origin) {
                        document.getElementById(pendingFile.id).children[0].textContent = "Uploading " + pendingFile.firstChunkCrc + " ... (" + percentageCompleted + "% complete) at " + uploadRate + " per second. " + estimatedRemainingTime + " remaining.";
                        $("#" + pendingFile.id).children(".progressbar").progressbar({
                            value: Math.floor(percentageCompleted)
                        });
                    },

                    //define a finishCallback showing the completion in the em element 
                    function (pendingFile, origin) {
                        document.getElementById(pendingFile.id).children[0].textContent = "Upload of " + pendingFile.originalFileName + " (" + pendingFile.originalFileSize + ") completed.";
                        deleteElementsButEmAndCancel(pendingFile.id);
                    },

                    //define an exception callback
                    function (message, origin, pendingFile /* pending file object that can be null! if null, it is a general error */ ) {
                        if (pendingFile) {
                            document.getElementById(pendingFile.id).children[0].textContent = message;
                        } else {
                            document.getElementById("error").textContent = message;
                        }
                    });

                }, false);

            }

            function deleteElementsButEmAndCancel(fileId) {
                var div = $('#' + fileId);
                var em = div.children(":first").detach();
                var cancel = div.children(".cancel").detach();
                div.empty();
                div.append(em);
                div.append(cancel);
                div.append(document.createElement('hr'));
            }

            function appendUploadControls(fileId) {

                //get the ui container
                var uiContainer = document.getElementById('uiContainer');

                //append a div
                var div = document.createElement("div");
                div.setAttribute('id', fileId);
                uiContainer.appendChild(div);

                ////
                //create the controls

                //progress bar
                var progressBar = document.createElement("div");
                progressBar.setAttribute("class", "progressbar");
                progressBar.setAttribute("style", "height:20px;");

                // rate input
                var rateInput = document.createElement("input");
                rateInput.type = "text";

                // rate button
                var rateButton = document.createElement("button");
                rateButton.addEventListener("click", function (e) {
                    jlfu.setRateInKiloBytes(getFileId(this), this.parentElement.children[2].value);
                });
                rateButton.appendChild(document.createTextNode('Apply'));

                // cancel link
                var cancel = document.createElement("A");
                cancel.setAttribute("href", "javascript:void(0);");
                cancel.setAttribute("class", "cancel");
                cancel.addEventListener("click", function (e) {
                    div.children[0].textContent = "Cancelling...";
                    jlfu.cancelFileUpload(getFileId(this), function (pendingFileId) {
                        var div = document.getElementById(pendingFileId);
                        div.parentElement.removeChild(div);
                    });
                });
                cancel.appendChild(document.createTextNode('Cancel'));

                // pause link
                var pause = document.createElement("A");
                pause.setAttribute("href", "javascript:void(0);");
                pause.addEventListener("click", function (e) {
                    div.children[0].textContent = "Pausing...";
                    jlfu.pauseFileUpload(getFileId(this), function (pendingFile) {
                        div.children[0].textContent = pendingFile.originalFileName + " is paused.";
                    });
                });
                pause.appendChild(document.createTextNode('Pause'));

                // resume link
                var resume = document.createElement("A");
                resume.setAttribute("href", "javascript:void(0);");
                resume.addEventListener("click", function (e) {
                    div.children[0].textContent = "Asking for resume...";
                    jlfu.resumeFileUpload(getFileId(this), function (pendingFile) {
                        div.children[0].textContent = "Resuming " + pendingFile.originalFileName + " ...";
                    });
                });
                resume.appendChild(document.createTextNode('Resume'));


                ////
                //append the controls to the div
                div.appendChild(document.createElement("em"));
                div.appendChild(progressBar);
                div.appendChild(document.createTextNode('Limit the upload rate to '));
                div.appendChild(rateInput);
                div.appendChild(document.createTextNode(' KB '));
                div.appendChild(rateButton);
                div.appendChild(document.createTextNode(' | '));
                div.appendChild(pause);
                div.appendChild(document.createTextNode(' | '));
                div.appendChild(resume);
                div.appendChild(document.createTextNode(' | '));
                div.appendChild(cancel);
                div.appendChild(document.createElement('hr'));


            }
        </script>
 
 
 
 
 
 
  -->
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

<div id="action_gif" class="my_notification" style="display: none;left: 46%;">
Processing Please wait...
</div>
              <div class="main_div">
                        <!----// HEADER --->
                        <div class="main_header">
                                  <div class="header">
                                     <div onclick="getPage('fileSystem')" style="cursor: pointer;" class="logo_space">
                                          <!---/// LOGO --->
                                           <img src="images/logo.png" />
                                            <!---//LOGO END -->
                                     </div>
                                    <!--------// SEARCH HERE --------->
                                  <div class="search_main">  
                                      <div class="search_main_div">
                                          <div class="search_icon" onclick="searchFromTop()"> 
                                          <img src="images/search.png"> </div>
                                          <div class="serach_top" >
                                               <input type="text" id="searchFromTop"  onkeypress="return runScript(event)" />
                                               <span><img src="images/arrow_down.png" /></span>
                                             <script type="text/javascript">
                                             function runScript(e) {
                                            	    if (e.keyCode == 13) {
                                            	    	 searchFromTop();
                                            	        return false;
                                            	    }
                                            	}
                                             
                                             
                                                    function searchFromTop(){
                                                    	$('.search_box_details').css('display','none');
                                            		 var myVar=setTimeout(myFunctionl,500);
                                                    	var urltext=$('#searchFromTop').val();
                                                    	//alert(urltext[1]);
                                                    	jQuery.get('searchDocByName', 
                                               				 	{
                                               					'name' : urltext
                                               					},
                                               				function( data ) {
                                               						if(data=="true"){location.href="ajaxTrue";}else{
                                               	         		$( ".right" ).html( data );
                                               	             myStopFunction(myVar);
                                               	            // alert('gfgf');
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
                                <div id="tabs_container">
                                     <!--    <ul id="tabs">
                                              <li class="active"><a href="#tab1">BASIC</a></li>
                                              <li><a class="icon_accept" href="#tab2">ADVANCED</a></li>
                                              <li><a href="#tab3">RECENT SEARCH</a></li>
                                        </ul> -->
                               	</div>
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
                                               						if(data=="true"){location.href="ajaxTrue";}else{
                                               							//alert('kkk');
                                               						   myStopFunction(myVar);
                                               							$( ".right" ).html( data );}
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
   <h1>Sharing and Security <div class="mange_can_top">X</div></h1>
   <div class="table_append">
                   <table class="append_tr">
                      <!--  <tr>
                           <td colspan="2">Link to share (only accessible by collaborators)</td>
                       </tr>
                       <tr>
                           <td colspan="2"><input type="text"  class="link_share"/></td>
                       </tr> 
                       <tr class="share_bottom">
                           <td colspan="2">Who has access</td>
                       </tr>
                       <tr>
                           <td>Hari Om Srivastava (you)<span class="email_share">hari@silvereye.co</span></td>
                           <td class="text_right">Is Owner</td>
                       </tr>-->
                       <tr class="share_bottom">
                           <td colspan="2">Invite people:</td>
                       </tr>
                       <tr>
                           <td><input type="text"  class="initive_people userforshare"  /></td>
                           
                           
                           <td>
                                      <!--// SHARE OPTION --->
<!-- <div class="share_option_dropdown">
<div class="for_share_icon">
-// ADD NEW -
<img src="images/eye-24-256.png" class="view_icon" />
<img src="images/edite.png" class="edite_icon" />
<img src="images/comment.png" class="comment_icon" />
-// ADD NEW ICON END -
<div class="clear"></div>
</div>
<span class="view_text">Can View</span>
<span class="can_text">Can Edit</span>
<span class="comment_text">Can Manage</span><div class="down_arrow_share"><img src="images/cal-open.png" /></div></div>

                                              <div class="share_menu_dropdown">
<ul>
<li class="can_view"> <span>&#x2714;</span> <div>Can View</div></li>
<li class="can_edit"> <span>&#x2714;</span> <div>Can Edit</div></li>
<li class="can_comment"> <span>&#x2714;</span> <div>Can Manage</div></li>
</ul>
</div>
             -->                          
                                      
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
                 
<%-- <script type="text/javascript">
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
</script>  --%>
                   <div class="clear"></div>
   
        </div>
        <!--    <table>
           		<tr>
           		<td colspan="2"><input type="checkbox" />Notify people via email<a href="javascript:void(0);">Add message</a></td>
          		</tr>
   				</table> 
   		-->
                 <div>
                     <!--   
                     <div class="your_self">
                     <input type="checkbox"/>
                     <a href="javascript:void(0);">Send a copy to myself </a></div>
                     -->   
                     <div class="share_right">
                               <div class="share_more">Add More</div>
                               <div class="cancel_share mange_can">Cancel</div>
                               <div class="send_share" id="shareButtonId" onclick="assignSinglePermissions('currentFolder')" >Share</div>
                     </div>
                 </div>
             <div class="clear"></div>    
</div>
<div class="web_dialog_overlay" ></div>
<div class="mid_loading" > <img src="images/loading2.gif" />
<h1>Loading....</h1>
</div>
<!---------// SHARING PAGES END---------->
<!-- assiging permissions using new view -->
<script type="text/javascript">
	function assignSinglePermissions(doctype) {
		$('.sharing_mange').hide();
	    $('.web_dialog_overlay').hide();
		var count=0;
		var myVar=setTimeout(myFunctionl,500);
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
				value = valu[1];
			//	alert("user = "+user+"  value = "+value);
				$.ajax({
					type : "GET",
					url : "${pageContext.request.contextPath}/assignSinglePermission",
					data : {
						'user' : user,
						'value' : value,
						'doctype' : doctype,
					},
					contentType : "application/json",
					async : true,
					success : function(data) {
						if(data=="true"){location.href="ajaxTrue";}else{
							myStopFunction(myVar);
							alert("Shared Successfully");
						}
					}
				}); 
				}
			});
		});
	}
</script>
<script type="text/javascript">
	function getDocProperties(folderPath) {
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
		$('#oldFolderName').val(folderPath);
		//alert(folderPath.lastIndexOf('/'));
		$('#newFolderName').val(folderPath.substring(folderPath.lastIndexOf("/")+1));
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
			myStopFunction(myVar);
		});
			$(".downloadFolder").attr('id',folderPath);
			$(".download_right").attr('id',folderPath);
	}
</script>
<div id="contactdiv_6">
<form:form class="uploadForm" id="upload" method="post" action="uploadDocumentByJcr"
 commandName="fileupload"
 enctype="multipart/form-data">
			<div id="drop">
			<span>	Drop Here </span>
<div class="textClose" ><span >X</span></div>
				<a>Browse</a>
				<input type="file" name="upl" multiple />
			</div>
</form:form>
<form:form class="uploadForm1" id="upload" method="post" action="uploadDocumentByJcr"
 commandName="fileupload"
 enctype="multipart/form-data">
<div class="uploadMultiple"> 
			<ul>
			</ul>
			<div class="clear"></div>    
</div>
<input type="button" class="finishUpload" value="Finish" />
<div class="clear"></div> 
</form:form>
<%-- 	<form:form id="contact" class="form uploadHide1" method="post"
		action="uploadDocumentByJcr" commandName="fileupload"
		enctype="multipart/form-data">
		<h3>Add New Documents</h3>
		<p>
			File Name: <span>*</span>
		</p>
		<input class="custom-file-input attachment_file cc_clear"  name="file2" id="file2" multiple type="file"
			 />
		<input type="button" value="Upload" onclick="uploadFormData()"/>
		<input type="button" value="Cancel" class="cancle" onclick="hideUpload()" />
	</form:form> --%>


	<script type="text/javascript">
		function uploadFormData() {
			$("#contactdiv_6").css("display", "none");
         	
			var oMyForm = new FormData();
			for (var i = 0; i < file2.files.length; i++) {
				oMyForm.append("file" + i, file2.files[i]);
			}
			 $(".uploadHide").hide();
			// document.getElementById('action_gif').style.display= 'block';
			var myVar=setTimeout(myFunctionl,500);
	       	 // $(".gifLoader").show();
			$.ajax({
				url : '${pageContext.request.contextPath}/uploadDocumentByJcr',
				data : oMyForm,
				dataType : 'text',
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(data) {
					if(data=="true"){location.href="ajaxTrue";}else{
					// $(".uploadHide").hide();
			       	//  $(".gifLoader").hide();
			       	//alert(data);
					var alt=data.substring(data.lastIndexOf(",")+1);
					data=data.substring(0,data.lastIndexOf(","));
					$("#fileThumbView>ul").append(data);
					//alert(alt);
					//document.getElementById('action_gif').style.display= 'none';
					myStopFunction(myVar);
					
					}
				}
			});
			$('.cc_clear').val('');

		}
function hideUpload(){
	$("#contactdiv_6").css("display", "none");
}
	</script>

 <!-- <div class="gifLoader"><img src="images/loader.gif" alt="Uploading, Please wait..." /></div> -->
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
        					$("#contactdiv_77").css("display", "none");
        					var myVar=setTimeout(myFunctionl,500);
                    	  //	var docPath=document.getElementById("oldFolderName").value;
                    	  	var docPath=document.getElementById("multiPath").value;
                    	 	// alert(docPath);
                    	  $.ajax({
          					type : "GET",
          					url : "${pageContext.request.contextPath}/recycleDoc",
          					contentType : "application/json",
          					data :{
          						docPath: docPath,
          					},
          					async : true,
          					success : function(data) {
          						if(data=="true"){location.href="ajaxTrue";}else{

               	         			myStopFunction(myVar);
          						//$("#folderView>.row_content>ul").append(data);
          						 folderPath=data;
          					//alert(folderPath);
                        	jQuery.post("getFileSystem", 
                   				 	{
                   					'path' : folderPath
                   					},
                   				function( data ) {
                   						if(data=="true"){
                   							location.href="ajaxTrue";
                   							}else{
	                   	         			$( ".right" ).html( data );
	                   	         			myStopFunction(myVar);
                   						}
                   	        		});
          					}}
          				}); 
                      });
                      });
       </script>
</div>
<!-----------------/// DELETE POP UP  END HERE ---------->



<!---------------//// ADD GROUP USER POP UP ----------->
<div id="contactdiv_66">
	<form class="form" action="#" id="contact">
		<h3>Create Folder</h3>
		<p>
			Please enter a new Folder name <span>*</span>
		</p>
		<input type="text" id="folderName" /> <%-- <input type="hidden"
			id="parentfolderName" value='<%=currentFolder.getFolderPath()%>' /> --%>
		<br />
		<div class="clear"></div>
		<input type="button" value="Create" onclick="createFolder()" /> <input
			type="button" id="cancel" value="Cancel" /> <br />
		<script type="text/javascript">
			function createFolder() {
				var myVar=setTimeout(myFunctionl,500);
				var folder = $('#folderName').val();
				if(folder.indexOf('.')>=0||folder.indexOf('.')>=0
						||folder.indexOf('@')>=0||folder.indexOf(',')>=0
						||folder.indexOf('*')>=0||folder.indexOf('>')>=0
						||folder.indexOf('<')>=0||folder.indexOf(')')>=0
						||folder.indexOf('(')>=0){
					alert('Please do not use characters like ./,@<>()*');
				}else{
					$("#contactdiv_66").css("display", "none");
				//alert(folder);
				$.ajax({
					type : "GET",
					url : "${pageContext.request.contextPath}/createFolder",
					data : {
						'folderName' : folder
					},
					contentType : "application/json",
					async : true,
					success : function(data) {
						if(data=="true"){location.href="ajaxTrue";}else{
						
							jQuery.post("getFileSystem", {
								'path' : data
							}, function(data) {
								if (data == "true") {
									location.href = "index";
								}
								$(".right").html(data);
							});
						}
						//$("#folderThumbView>ul").append(data);}
						// alert(data);
					}
				});}
				$('#folderName').val("");
				getDocProperties($('#parentfolderName').val());
				myStopFunction(myVar);
			}
		</script>
	</form>
</div>
              <!-----------/// ADD KEYWORD STRED HERE ---------->
              <div class="key_word_box">
                <h1>Add Keyword</h1>
                  <!--// ADD BOX -------->
                     <div class="keyword_box">
                               <ul>
                     <li>Keyword </li>
                     <li>
                     <select style="height: 29px;" id="add_keywordkey" onchange="keywordKeyChange(this.value)">
                     <%
                     String keywordkeys=Config.EDMS_KEYWORDKEY;
                     String[] keywordkey=keywordkeys.split(",");
                     for(int i=0;i<keywordkey.length;i++){
                     %>
                    
                     <option value="<%=keywordkey[i]%>"><%=keywordkey[i]%></option>
                     <%} %>
                       <option value="">Other</option>
                     </select>
                     <input type="text" class="keyword_name Datepicker_33"  style="display: none;" maxlength="75" /> 
                     <input type="text" class="keyword_name datepicker" id="add_keywordid" maxlength="75" />
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
          					if(data=="true"){location.href="ajaxTrue";}else{}
          					//$("#folderThumbView>ul").append(data);
          					// alert(data);
          				}

          			});
          			var keywordname = $('#add_keywordid').val()
          			if($('#add_keywordid').val()=='')
          			{
          				alert('PLease Enter the keyword !');
          				
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
          					if(data=="true"){location.href="ajaxTrue";}else{}
          					//$("#folderThumbView>ul").append(data);
          					// alert(data);
          				}

          			});
          			var keywordname = $('#add_keywordid').val()
          			if($('#add_keywordid').val()=='')
          			{
          				alert('PLease Enter The Value !')
          				
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
				alert('PLease Enter The Value !')
				
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
			alert('PLease Enter The Value !')
			
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
                              							location.href="index";
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
			alert(data);	
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
	var sourcePath=sourcePaths.split(',');
	var sourcePathMulti=sourcePaths.substring(0,sourcePaths.lastIndexOf(','));
	//alert(sourcePathMulti);
	var destPath=$('#oldFolderName').val();
	//var pathtohide=sourcePath[0];
	//alert($('#multiPath').val());
	if(sourcePath[0]==destPath){
		alert("source and destination can not be same");
		}else{
			//alert(sourcePath);
			if(sourcePath[(sourcePath.length-1)]=="cut"){
				//var myVar=setTimeout(myFunctionl,500);
				jQuery.get("moveDoc", {
					//'sourcePath' : sourcePath[0],
					'sourcePath' : sourcePathMulti,
					'destPath': destPath,
				}, function(data) {
					if (data == "true") {
						location.href = "index";
					}
					else{
						$('#cutCopyDocPath').val('');
						jQuery.post("getFileSystem", {
							'path' : data
						}, function(data) {
							if (data == "true") {
								location.href = "index";
							}
							$(".right").html(data);
						});
					}
					//$("#"+pathtohide).remove();
					//$("#"+pathtohide)
					//myStopFunction(myVar);
					//alert("Moved Successfully");
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
					 	jQuery.post("getFileSystem", {
							'path' : data
						}, function(data) {
							if (data == "true") {
								location.href = "index";
							}
							$(".right").html(data);
						}); 
					//	myStopFunction(myVar);
					  //  alert("Copied Successfully");
					}
					});
				//alert($('#cutCopyDocPath').val()+" to "+$('#oldFolderName').val());
			}
		}
		}
</script>
       <script type="text/javascript">
                         	function restoreVersion(folderPath){
                         		//alert(folderPath);
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
                   						//$("#folderView>.row_content>ul").append(data);
                   						 alert(data);
                   					}

                   				}); 
                         	
                         	}
                         
                         </script>
                         
                                                
                                                
                                                <div id="dialog" title="File Download">
  <div class="progress-label">Starting download...</div>
  <div id="progressbar"></div>
</div>
<!-- <button id="downloadButton">Start Download</button> -->