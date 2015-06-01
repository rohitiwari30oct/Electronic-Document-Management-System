<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/interface/ReverseClass.js'></script>
<script type='text/javascript' src='dwr/util.js'></script>

<!--jQuery and jQuery UI with jQuery Chat-->
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<link type="text/css" href="css/jquery.ui.chatbox.css" rel="stylesheet" />
<link type="text/css" href="css/new_icon.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.ui.chatbox.js"></script>

<script src="js/jquery-1.7.2.min.js" type="application/javascript" ></script>
<script src="js/left_event.js" type="application/javascript"></script>
<script src="js/jquery_popup.js"></script>
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

<script type="text/javascript">
function getActivitiDiagramsPage(){
	jQuery.get("header_activity", function( data ) {
			if(data=="true"){
					location.href="index";
				}
		 $( "#variedPagesHere" ).html( data );
		});
	jQuery.get("header_activitydiagrams", function( data ) {
			if(data=="true"){
					location.href="index";
				}
		 $( "#activitiForms" ).html( data );
		});
}
</script>
<script type="text/javascript">
	function getPage(requestPage) {
		//alert(requestPage);
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
		jQuery.get(requestPage, 
		/* 		 {
			'path' : folderPath
		}, */
			function( data ) {
				if(data=="true"){
						location.href="index";
					}
	         $( ".right" ).html( data );
	        });
	}
</script>
 <script type="text/javascript">
	function getSubFolders(folderPath) {
		var divFolder = folderPath.substr(6);
	     if($(".listdiv" + divFolder).css('display')=='none')
		  {
			  $(".listdiv" + divFolder).addClass('subfolder_open');
			  $("#sign" + divFolder).addClass('subfolder_minus');

	      }
		  else
		  {
			  $(".listdiv" + divFolder).removeClass('subfolder_open');
			  $("#sign" + divFolder).removeClass('subfolder_minus');
		  }
		
		//alert(folderPath);
		//alert(divFolder);
	 	var divContent = $(".listdiv" + divFolder).html();
		//alert(divContent.length);
		if (divContent.length > 30) {
		
		} else {
/* 
			alert(divContent);
			var folderId = "#" + folderPath;
			alert(folderId); */
			$.ajax({
				type : "GET",
				url : "${pageContext.request.contextPath}/getSubFolders",
				data : {
					'path' : folderPath
				},
				success : function(data) {
 					if(data=="true"){
							location.href="index";
						}
					//alert(data);
					//$(".mydocument_subfolder").html(data);
					divFolder=".listdiv" + divFolder;
					//alert(divFolder);
					$(divFolder).html(data);
				}
			});
		}
	//	getFileSystem(folderPath);
		}
</script>
<script type="text/javascript">
	function getFileSystem(folderPath) {
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
		jQuery.get("getFileSystem", 
				 {
			'path' : folderPath
		},
				function( data ) {
				if(data=="true"){
						location.href="index";
					}
	         $( ".right" ).html( data );
	        });
	}
</script>




<script type="text/javascript">
	function getSharedFileSystem(folderPath) {
		jQuery.get("getSharedFileSystem", 
				 {
			'path' : folderPath
		},
				function( data ) {
				if(data=="true"){
						location.href="index";
					}
	         $( ".right" ).html( data );
	        });
	}
</script>
