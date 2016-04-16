                        <!---// RIGHT --->
                        <%@page import="edms.wsdl.File"%>
<%@page import="edms.wsdl.Folder"%>
<%@page import="java.util.List"%>
<div class="other_pages">
                                  <!-------------/// TRASH PAGES STARED HERE --------->
                                  
                                       <!--------/// TRASH MENU STARTED HERE --------->
                                           <div class="trash_menu">
                                               <h1>Recycle Bin</h1>
                                               <div class="trash_right">
                                                   <ul>
                                                      <!--  <li class="trash_1" ><a href="javascript:void(0);"></a></li>
                                                       <li class="trash_2"><a href="javascript:void(0);"></a></li> -->
                                                       <li class="trash_3" title="Restore" onclick="restoreFolder()"><a href="javascript:void(0);"></a></li>
                                                       <li class="trash_4" title="Delete forever"onclick="deleteFolder()"><a href="javascript:void(0);"></a></li>
                                                   </ul>
                                               </div>
                                           </div>
                                       <!--------------/// TRASH MENU END HERE ------------>
                                    <div class="trash_sroll_content">
                                       <!--------/// TRASH CONTENT STARED HERE ------------->
                                       <div class="trash_content">
                                       <%
                                       List<Folder> folderList = (List<Folder>) request.getAttribute("folderList"); 
                                       List<File> fileList = (List<File>) request.getAttribute("fileList"); 
                        				
                                       %>
                                                <ul>
	                                        	<%				
	      				
									      				for (Folder folder : folderList) {
									      					%>
                                                        <li title="<%=folder.getFolderName() %>" style="  height: 110px;" class="space select_box target folderContextMenuClass" onclick="setFolderPath(this.id)" oncontextmenu="setFolderPath(this.id);getMenu()" id='<%=folder.getFolderPath()%>'>
                                                          <div class="folder_icon"></div>
                                                          <span><%=folder.getFolderName() %></span> </li>
                                                      
                                                        <%} %>
	                                        	<%				
	      				
									      				for (File file : fileList) {
									      					%>
                                                        <li title="<%=file.getFileName() %>" style="  height: 110px;" class="space select_box target folderContextMenuClass" onclick="setFolderPath(this.id)"  oncontextmenu="setFolderPath(this.id);getMenu()" id='<%=file.getFilePath()%>'>
                                                         <%
							if(file.getFileName().contains(".pdf")){
						%>
						<div class="new_pdf"></div> <%
 	}else if(file.getFileName().contains(".doc")){
 %>
						<div class="new_word"></div> <%
 	}else if(file.getFileName().contains(".xls")||file.getFileName().contains(".csv")){
						%>
						<div class="new_msexcel"></div> <%
 	}else if(file.getFileName().contains(".ppt")){
		%>
		<div class="new_ppt"></div> <%
}else if(file.getFileName().contains(".jpg")){
	%>
	<div class="new_jpg"></div> <%
}else if(file.getFileName().contains(".png")){
	%>
	<div class="new_png"></div> <%
}else if(file.getFileName().contains(".gif")){
	%>
	<div class="new_gif"></div> <%
}else if(file.getFileName().contains(".xml")||file.getFileName().contains(".vcf")||file.getFileName().contains(".pod")||file.getFileName().contains(".ics")){
	%>
	<div class="new_txt"></div> <%
}else if(file.getFileName().contains(".txt")){
	%>
	<div class="new_txt"></div> <%
}else if(file.getFileName().contains(".bmp")){
	%>
	<div class="blank_image"></div> <%
}else if(file.getFileName().contains(".ico")){
	%>
	<div class="new_ico"></div> <%
}else{
 %>
						<div class="blank_image"></div> <%
 	} %>
                                                          <span><%=file.getFileName() %></span> </li>
                                                      
                                                        <%} %>
                                                </ul>
                                                <input type="hidden" id="clickedFolder" value=""/>
                                                <script type="text/javascript">
                                                function setFolderPath(clickedFolder){
                                                	//alert(clickedFolder);
                                                	$('#clickedFolder').val(clickedFolder);
                                                	//alert($('#clickedFolder').val());
                                                }
                                                </script>
                                                <script type="text/javascript">
                                                function deleteFolder(){
                                                	//if(confirm('Do you really want to permanently delete this item ?')){
													var folPath=	$('#multiPath').val();
													if(folPath.length>6)
                                                		  event_del_conf("confirm","Do you want to delete this item ?");
                                                	
                                                //	}
                                                }
                                                
                                                </script>
                                                
                                                <script >


function event_del_conf(type,msg) {
     //alert(id);
       var n = noty({
         text        : msg,
         type        : type,
         theme       : 'relax',
         dismissQueue: false,
         layout      : 'center',
         theme       : 'defaultTheme',
         buttons     : (type != 'confirm') ? false : [
             {addClass: 'btn btn-primary', text: 'Ok', onClick: function ($noty) {
                 
               $noty.close();
             
//           	var folderPath=$('#clickedFolder').val();
       		var folderPath=$('#multiPath').val();
           	//alert(folderPath);
       	
       	
			var myVar=setTimeout(myFunctionl,500);
       	$.ajax({
					type : "GET",
					url : "${pageContext.request.contextPath}/deleteDoc",
					data : {
						'folderPath':folderPath,
					},
					contentType : "application/json",
					async : false,
					success : function(data) {
    					if(data=="ajaxTrue"){
 							location.href="index";
 						}
						//alert(data);
						
						getPage('trash');
						myStopFunction(myVar);
					}
				}); 
             }
             },
             {addClass: 'btn btn-danger', text: 'Cancel', onClick: function ($noty) {
                 $noty.close();
             
             }
             }
         ]
     });
    
         
         //console.log(type + ' - ' + n.options.id);
         return n; 
          
     }




</script>
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                <script type="text/javascript">
                                                function restoreFolder(){
                                                	var folPath=	$('#multiPath').val();
													if(folPath.length>6)
                                          		  event_del_confres("confirm","Do you really want to restore this item ? In case restoration path doesn't exist, it will be restored at home folder!");
                                                	//if(confirm("Do you really want to restore this item ? In case restoration path doesn't exist, it will be restored at home folder")){
                                                
                                                	//}
                                                }
                                                
                                                
                                                

                                                function event_del_confres(type,msg) {
                                                     //alert(id);
                                                       var n = noty({
                                                         text        : msg,
                                                         type        : type,
                                                         theme       : 'relax',
                                                         dismissQueue: false,
                                                         layout      : 'center',
                                                         theme       : 'defaultTheme',
                                                         buttons     : (type != 'confirm') ? false : [
                                                             {addClass: 'btn btn-primary', text: 'Ok', onClick: function ($noty) {
                                                                 
                                                               $noty.close();
                                                             
//                                                       	var folderPath=$('#clickedFolder').val();
                                                           	//alert(folderPath);
                                                               
           													var myVar=setTimeout(myFunctionl,500);
                                                           	$.ajax({
                                                   					type : "GET",
                                                   					url : "${pageContext.request.contextPath}/restoreDoc",
                                                   					data : {
                                                   						'folderPath':$('#clickedFolder').val(),
                                                   					},
                                                   					contentType : "application/json",
                                                   					async : false,
                                                   					success : function(data) {
                                                        					if(data=="ajaxTrue"){
                                                     							location.href="index";
                                                     						}
                                                        					else{
                                                        					showMsg("success",data);
                                                   						getPage('trash');
                                                   						}
                                                   						myStopFunction(myVar);
                                                   					}
                                                   				}); 
                                                             }
                                                             },
                                                             {addClass: 'btn btn-danger', text: 'Cancel', onClick: function ($noty) {
                                                                 $noty.close();
                                                             
                                                             }
                                                             }
                                                         ]
                                                     });
                                                    
                                                         
                                                         //console.log(type + ' - ' + n.options.id);
                                                         return n; 
                                                          
                                                     }
                                                
                                                
                                                
                                                
                                                
                                                </script>
                                         </div>
                                       <!-----------/// TRASEH CONTENT END HERE ------------->
                                  
                                </div>
                                  
                                  <!-------------/// TRASH PAGES END HERE ------------>
                                  
                        </div>
                        <!----// RIGHT END HERE -->
<div class="right_click_menu">
			<ul>
			
		
				<li id="folderRightMenuRestore" onclick="restoreFolder()" id="downloadButton" ><div class="right_images">
						<img src="images/paste_icon.png" />
						<div class="clear"></div>
					</div>
					<span>Restore</span>
				<div class="clear"></div></li>
				<!--  <li class="download_right"><div class="right_images"><img src="images/download.png"/><div class="clear"></div></div><span>download</span><div class="clear"></div></li> -->
				<li id="folderRightMenuRemove" onclick="deleteFolder()" ><div class="right_images">
						<img src="images/delete_icon_file.png" />
						<div class="clear"></div>
					</div>
					<span>Permanently Delete</span>
				<div class="clear"></div></li>
			
				
				
			</ul>
		</div>
<input type="hidden" id="multiPath" />
              <script type="text/javascript">
          var recent_win_he = $(window).height();
          //alert(recent_win_he);
          $('.other_pages').css('height',recent_win_he-129);
          

          $('.trash_sroll_content').css('height',recent_win_he-129);
			</script>
            <script type="text/javascript">
        	function getMenu(){
            
            var docPath=document.getElementById("multiPath").value;
			var mul=docPath.split(",");
			
			
			if(mul.length>1){
				$('#folderRightMenuRestore').css('display', 'none');
			}else{

				$('#folderRightMenuRestore').css('display', 'block');
				$('#folderRightMenuRemove').css('display', 'block');
			}}
				</script>