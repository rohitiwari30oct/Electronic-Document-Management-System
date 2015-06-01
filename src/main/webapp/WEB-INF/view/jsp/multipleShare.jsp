<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="share_option">
                      <!-----/// TOP SHARED OPTION ---->
                      <div class="shared_top">
                       <img src="images/cancel.png" class="cancel_popup" />
                      </div>
                      <!-----// TOP SHARED END HERE ---->
                      <h1 class="user user_option user_select">Users</h1><h1 class="user_group">Group</h1>
                      <div class="group_shared_size user_inner">
                      
                         <table>
                         
                         <tr style="background-color: #e1e1e1;">
                         <td><input type="checkbox"  id="usersselectall" /> <img style=" padding-top: 1px;
    width: 13px;"  src="images/single_user.png" />Users</td>
                         </tr>
                     			<tr>
                               <td align="top" ><input type="checkbox" name="users" value="sanjay@avi-oil.com"/>
                               <img style=" padding-top: 1px;
    width: 13px;" src="images/single_user.png" />sanjay@avi-oil.com</td>
                             </tr>
                             
                             <tr>
                               <td align="top" ><input type="checkbox" name="users" value="santosh@avi-oil.com"/>
                               <img style=" padding-top: 1px;
    width: 13px;"  src="images/single_user.png" />santosh@avi-oil.com</td>
                             </tr>
                              <tr>
                               <td align="top" ><input type="checkbox" name="users" value="janak@avi-oil.com"/>
                               <img style=" padding-top: 1px;
    width: 13px;"  src="images/single_user.png" />janak@avi-oil.com</td>
                             </tr>
                      </table>
                      </div>
                      <div class="group_shared_size group_inner">
                         <table>
                         <tr style="background-color: #e1e1e1;">
                         <td><input type="checkbox" id="groupsselectall" /> <img src="images/group.png" />Groups</td>
                         </tr>
                             <tr>
                               <td align="top" ><input type="checkbox" name="groups" value="finance"/><img src="images/group.png" />finance</td>
                             </tr>
                             <tr>
                               <td align="top" ><input type="checkbox" name="groups" value="accounts"/><img src="images/group.png" />accounts</td>
                             </tr>
                             <tr>
                               <td align="top" ><input type="checkbox" name="groups" value="management"/><img src="images/group.png" />management</td>
                             </tr>
                      </table>
                      </div>
                      <h1 class="Permissions">Permissions</h1>
                      <div class="group_shared_bottom user_details">
                             <table class="shared_heading">
                             <tr style="background-color: #e1e1e1;">
                               <td   align="top" class="space_td">Permissions for Users</td>
                               <td >Allow </td>
                               <td >Deny </td>
                             </tr>
                             <tr>
                               <td align="top" class="space_td" id="readAccess"><img  style=" padding-top: 1px;
   								 width: 13px;"   src="images/single_user.png" /> Full control</td>
                               <td><input type="checkbox"  id="userpermissionselectall"/></td>
                               <td class="deny"><input type="checkbox"  id="userdenypermissionselectall"/></td>
                             </tr>
                             <tr>
                               <td align="top" class="space_td"><img  style=" padding-top: 1px;
    width: 13px;"  src="images/single_user.png" /> Read</td>
                               <td><input type="checkbox" name='userpermission' value='1'/></td>
                               <td><input type="checkbox" name='denyuserpermission' value='-1'/></td>
                             </tr>
                             <tr>
                               <td align="top" class="space_td"><img   style=" padding-top: 1px;
    width: 13px;"   src="images/single_user.png" /> Read &amp; Write</td>
                               <td><input type="checkbox"  name='userpermission' value='2'/></td>
                               <td><input type="checkbox" name='denyuserpermission' value='-2'/></td>
                             </tr>
                             <tr>
                               <td align="top" class="space_td"><img  style=" padding-top: 1px;
    width: 13px;"  src="images/single_user.png" /> Delete</td>
                               <td><input type="checkbox" name='userpermission' value='4'/></td>
                               <td><input type="checkbox" name='denyuserpermission' value='-4'/></td>
                             </tr>
                              <tr>
                               <td align="top" class="space_td"><img   style=" padding-top: 1px;
    width: 13px;" src="images/single_user.png" /> ModifyAccessControl </td>
                             <td><input type="checkbox" name='userpermission' value='true'/></td>
                             <td><input type="checkbox" name='denyuserpermission' value='false'/></td>
                             </tr>
                             
                              
                      </table>
                      
                    
                      </div>
                    <div class="group_shared_bottom group_details">
                            <table class="shared_heading">
                             <tr style="background-color: #e1e1e1;">
                               <td  align="top" class="space_td">Permissions for Groups</td>
                               <td >Allow </td>
                               <td >Deny </td>
                             </tr>
                             <tr>
                               <td align="top" class="space_td" id="readAccess"><img  style="width: 16px;" src="images/group.png" /> Full control</td>
                               <td><input type="checkbox" id="grouppermissionselectall"/></td>
                               <td class="deny"><input type="checkbox"  id="groupdenypermissionselectall"/></td>
                             </tr>
                             <tr>
                               <td align="top" class="space_td"><img style="width: 16px;" src="images/group.png" /> Read</td>
                               <td><input type="checkbox" name='grouppermission' value='1'/></td>
                               <td><input type="checkbox" name='denygrouppermission' value='-1'/></td>
                             </tr>
                             <tr>
                               <td align="top" class="space_td"><img  style="width: 16px;"  src="images/group.png" /> Read &amp; Write</td>
                               <td><input type="checkbox"  name='grouppermission' value='2'/></td>
                               <td><input type="checkbox" name='denygrouppermission' value='-2'/></td>
                             </tr>
                             <tr>
                               <td align="top" class="space_td"><img  style="width: 16px;" src="images/group.png" /> Delete</td>
                               <td><input type="checkbox" name='grouppermission' value='4'/></td>
                               <td><input type="checkbox" name='denygrouppermission' value='-4'/></td>
                             </tr>
                              <tr>
                               <td align="top" class="space_td"><img  style="width: 16px;" src="images/group.png" /> ModifyAccessControl </td>
                               <td><input type="checkbox" name='grouppermission' value='true'/></td>
                               <td><input type="checkbox" name='denygrouppermission' value='false'/></td>
                             </tr>
                             
                             
                      </table>
                      	<div class="claer"></div>
                      
                      </div> 
                      
                      <div class="savePermissions" >
                          <input class='savePermissionsButton' type="button"  value="save" onclick="getValues()"/> 
                      </div>
                 <script type="text/javascript">
                      $(document).ready(function() {

                  	    $('#usersselectall').click(function(event) { 
                  	    	//alert('sdf');
                  	    	//on click
                  	        if(this.checked) { // check select status
                  	            $('input[name="users"]').each(function() { //loop through each checkbox
                  	                this.checked = true;  //select all checkboxes with class "checkbox1"              
                  	            });
                  	        }else{
                  	            $('input[name="users"]').each(function() { //loop through each checkbox
                  	                this.checked = false; //deselect all checkboxes with class "checkbox1"                      
                  	            });        
                  	        }
                  	    });
                	    $('#groupsselectall').click(function(event) { 
                	    	//alert('sdf');
                	    	//on click
                	        if(this.checked) { // check select status
                	            $('input[name="groups"]').each(function() { //loop through each checkbox
                	                this.checked = true;  //select all checkboxes with class "checkbox1"              
                	            });
                	        }else{
                	            $('input[name="groups"]').each(function() { //loop through each checkbox
                	                this.checked = false; //deselect all checkboxes with class "checkbox1"                      
                	            });        
                	        }
                	    });
                	    $('#grouppermissionselectall').click(function(event) { 
                	    	//alert('sdf');
                	    	//on click
                	        if(this.checked) { // check select status
                	            $('input[name="grouppermission"]').each(function() { //loop through each checkbox
                	                this.checked = true;  //select all checkboxes with class "checkbox1"              
                	            });
                	        }else{
                	            $('input[name="grouppermission"]').each(function() { //loop through each checkbox
                	                this.checked = false; //deselect all checkboxes with class "checkbox1"                      
                	            });        
                	        }
                	    });
                  	    $('#groupdenypermissionselectall').click(function(event) { 
                  	    	//alert('sdf');
                  	    	//on click
                  	        if(this.checked) { // check select status
                  	            $('input[name="denygrouppermission"]').each(function() { //loop through each checkbox
                  	                this.checked = true;  //select all checkboxes with class "checkbox1"              
                  	            });
                  	        }else{
                  	            $('input[name="denygrouppermission"]').each(function() { //loop through each checkbox
                  	                this.checked = false; //deselect all checkboxes with class "checkbox1"                      
                  	            });        
                  	        }
                  	    });
                  	    $('#userpermissionselectall').click(function(event) { 
                  	    	//alert('sdf');
                  	    	//on click
                  	        if(this.checked) { // check select status
                  	            $('input[name="userpermission"]').each(function() { //loop through each checkbox
                  	                this.checked = true;  //select all checkboxes with class "checkbox1"              
                  	            });
                  	        }else{
                  	            $('input[name="userpermission"]').each(function() { //loop through each checkbox
                  	                this.checked = false; //deselect all checkboxes with class "checkbox1"                      
                  	            });        
                  	        }
                  	    });
                	    $('#userdenypermissionselectall').click(function(event) { 
                	    	//alert('sdf');
                	    	//on click
                	        if(this.checked) { // check select status
                	            $('input[name="denyuserpermission"]').each(function() { //loop through each checkbox
                	                this.checked = true;  //select all checkboxes with class "checkbox1"              
                	            });
                	        }else{
                	            $('input[name="denyuserpermission"]').each(function() { //loop through each checkbox
                	                this.checked = false; //deselect all checkboxes with class "checkbox1"                      
                	            });        
                	        }
                	    });
                    	   
                    	});
                      </script>
             			<script type="text/javascript">
                      function getValues(){
                    	  
                      var chkUser = '';
                      $('input[name="users"]:checked').each(function() {
                    	
                        chkUser += $(this).val() + ",";
                      });
                      chkUser = chkUser.slice(0,-1);// Remove last comma 

                      var chkGroup = '';
                      $('input[name="groups"]:checked').each(function() {
                        
                    	  chkGroup += $(this).val() + ",";
                      });

                      chkGroup = chkGroup.slice(0,-1);// Remove last comma 

                      var chUserPermission = '';
                      $('input[name="userpermission"]:checked').each(function() {
                        
                    	  chUserPermission += $(this).val() + ",";
                      });
              
                    //  chUserPermission = chUserPermission.slice(0,-1);// Remove last comma 
                      var chGroupPermission = '';
                      $('input[name="grouppermission"]:checked').each(function() {
                        
                    	  chGroupPermission += $(this).val() + ",";
                      });
                    //  chGroupPermission = chGroupPermission.slice(0,-1);// Remove last comma 
                      

                      $('input[name="denyuserpermission"]:checked').each(function() {
                        
                    	  chUserPermission += $(this).val() + ",";
                      });
              
                      chUserPermission = chUserPermission.slice(0,-1);// Remove last comma 

                      $('input[name="denygrouppermission"]:checked').each(function() {
                        
                    	  chGroupPermission += $(this).val() + ",";
                      });
                      chGroupPermission = chGroupPermission.slice(0,-1);// Remove last comma 
                      
                      
                      $.ajax({
      					type : "GET",
      					url : "${pageContext.request.contextPath}/shareFolder",
      					data : {
      						'users' : chkUser,
      						'groups':chkGroup,
      						'userpermissions':chUserPermission,
      						'grouppermissions':chGroupPermission
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
              </div>
</body>
</html>

<div style="width: 100%;">
              <div class="share_option">
                      <!-----/// TOP SHARED OPTION ---->
                      <div class="shared_top">
                       <img src="images/cancel.png" class="cancel_popup" />
                      </div>
                      <!-----// TOP SHARED END HERE ---->
                      <h1 class="user user_option user_select">Users</h1><h1 class="user_group">Group</h1>
                      <div class="group_shared_size user_inner">
                      
                         <table>
                         
                         <tr style="background-color: #e1e1e1;">
                         <td><input type="checkbox"  id="usersselectall" /> <img style=" padding-top: 1px;
    width: 13px;"  src="images/single_user.png" />Users</td>
                         </tr>
                     			<tr>
                               <td align="top" ><input type="checkbox" name="users" value="sanjay@avi-oil.com"/>
                               <img style=" padding-top: 1px;
    width: 13px;" src="images/single_user.png" />sanjay@avi-oil.com</td>
                             </tr>
                             
                             <tr>
                               <td align="top" ><input type="checkbox" name="users" value="santosh@avi-oil.com"/>
                               <img style=" padding-top: 1px;
    width: 13px;"  src="images/single_user.png" />santosh@avi-oil.com</td>
                             </tr>
                              <tr>
                               <td align="top" ><input type="checkbox" name="users" value="janak@avi-oil.com"/>
                               <img style=" padding-top: 1px;
    width: 13px;"  src="images/single_user.png" />janak@avi-oil.com</td>
                             </tr>
                      </table>
                      </div>
                      <div class="group_shared_size group_inner">
                         <table>
                         <tr style="background-color: #e1e1e1;">
                         <td><input type="checkbox" id="groupsselectall" /> <img src="images/group.png" />Groups</td>
                         </tr>
                             <tr>
                               <td align="top" ><input type="checkbox" name="groups" value="finance"/><img src="images/group.png" />finance</td>
                             </tr>
                             <tr>
                               <td align="top" ><input type="checkbox" name="groups" value="accounts"/><img src="images/group.png" />accounts</td>
                             </tr>
                             <tr>
                               <td align="top" ><input type="checkbox" name="groups" value="management"/><img src="images/group.png" />management</td>
                             </tr>
                      </table>
                      </div>
                      <h1 class="Permissions">Permissions</h1>
                      <div class="group_shared_bottom user_details">
                             <table class="shared_heading">
                             <tr style="background-color: #e1e1e1;">
                               <td   align="top" class="space_td">Users</td>
                               <td >Read </td>
                               <td >Read &amp; Write </td>
                               <td >Delete </td>
                               <td >Modify Access Control </td>
                             </tr>
                           <!--   <tr>
                               <td align="top" class="space_td" id="readAccess"><img  style=" padding-top: 1px;
   								 width: 13px;"   src="images/single_user.png" /> Full control</td>
                               <td><input type="checkbox"  id="userpermissionselectall"/></td>
                               <td class="deny"><input type="checkbox"  id="userdenypermissionselectall"/></td>
                             </tr> -->
                             <tr>
                               <td align="top" class="space_td">
                               <img  style="padding-top: 1px;width: 13px;"  src="images/single_user.png" />sanjay@avi-oil.com </td>
                               <td><input type="checkbox" name='userpermission' value='sanjay@avi-oil.com,ur' /></td>
                               <td><input type="checkbox" name='userpermission' value='sanjay@avi-oil.com,uw' /></td>
                               <td><input type="checkbox" name='userpermission' value='sanjay@avi-oil.com,ud' /></td>
                               <td><input type="checkbox" name='userpermission' value='sanjay@avi-oil.com,us' /></td>
                             </tr>
                             <tr>
                               <td align="top" class="space_td">
                               <img  style="padding-top: 1px;width: 13px;"  src="images/single_user.png" />santosh@avi-oil.com </td>
                               <td><input type="checkbox" name='userpermission' value='santosh@avi-oil.com,ur' /></td>
                               <td><input type="checkbox" name='userpermission' value='santosh@avi-oil.com,uw' /></td>
                               <td><input type="checkbox" name='userpermission' value='santosh@avi-oil.com,ud' /></td>
                               <td><input type="checkbox" name='userpermission' value='santosh@avi-oil.com,us' /></td>
                             </tr>
                             <!-- <tr>
                               <td align="top" class="space_td"><img   style=" padding-top: 1px;
    width: 13px;"   src="images/single_user.png" />santosh@avi-oil.com </td>
                               <td><input type="checkbox"  name='userpermission' value='2'/></td>
                               <td><input type="checkbox" name='denyuserpermission' value='-2'/></td>
                               <td><input type="checkbox"  name='userpermission' value='2'/></td>
                               <td><input type="checkbox" name='denyuserpermission' value='-2'/></td>
                             </tr>
                             <tr>
                               <td align="top" class="space_td"><img  style=" padding-top: 1px;
    width: 13px;"  src="images/single_user.png" />janak@avi-oil.com</td>
                               <td><input type="checkbox" name='userpermission' value='4'/></td>
                               <td><input type="checkbox" name='denyuserpermission' value='-4'/></td>
                               <td><input type="checkbox" name='userpermission' value='4'/></td>
                               <td><input type="checkbox" name='denyuserpermission' value='-4'/></td>
                             </tr>
                              <tr>
                               <td align="top" class="space_td"><img   style=" padding-top: 1px;
    width: 13px;" src="images/single_user.png" /> ModifyAccessControl </td>
                             <td><input type="checkbox" name='userpermission' value='true'/></td>
                             <td><input type="checkbox" name='denyuserpermission' value='false'/></td>
                             <td><input type="checkbox" name='userpermission' value='true'/></td>
                             <td><input type="checkbox" name='denyuserpermission' value='false'/></td>
                             </tr>
                              -->
                              
                      </table>
                      
                    
                      </div>
                    <div class="group_shared_bottom group_details">
                            <table class="shared_heading">
                                <tr style="background-color: #e1e1e1;">
                               <td   align="top" class="space_td">Groups</td>
                               <td >Read </td>
                               <td >Read &amp; Write </td>
                               <td >Delete </td>
                               <td >Modify Access Control </td>
                             </tr>
                           <!--   <tr>
                               <td align="top" class="space_td" id="readAccess"><img  style=" padding-top: 1px;
   								 width: 13px;"   src="images/single_user.png" /> Full control</td>
                               <td><input type="checkbox"  id="userpermissionselectall"/></td>
                               <td class="deny"><input type="checkbox"  id="userdenypermissionselectall"/></td>
                             </tr> -->
                             <tr>
                               <td align="top" class="space_td">
                               <img style="width: 16px;" src="images/group.png" />Finance </td>
                               <td><input type="checkbox" name='userpermission' value='finance,gr' /></td>
                               <td><input type="checkbox" name='userpermission' value='finance,gw' /></td>
                               <td><input type="checkbox" name='userpermission' value='finance,gd' /></td>
                               <td><input type="checkbox" name='userpermission' value='finance,gs' /></td>
                             </tr><!-- 
                             <tr style="background-color: #e1e1e1;">
                               <td  align="top" class="space_td">Permissions for Groups</td>
                               <td >Allow </td>
                               <td >Deny </td>
                             </tr>
                             <tr>
                               <td align="top" class="space_td" id="readAccess"><img  style="width: 16px;" src="images/group.png" /> Full control</td>
                               <td><input type="checkbox" id="grouppermissionselectall"/></td>
                               <td class="deny"><input type="checkbox"  id="groupdenypermissionselectall"/></td>
                             </tr>
                             <tr>
                               <td align="top" class="space_td"><img style="width: 16px;" src="images/group.png" /> Read</td>
                               <td><input type="checkbox" name='grouppermission' value='1'/></td>
                               <td><input type="checkbox" name='denygrouppermission' value='-1'/></td>
                             </tr>
                             <tr>
                               <td align="top" class="space_td"><img  style="width: 16px;"  src="images/group.png" /> Read &amp; Write</td>
                               <td><input type="checkbox"  name='grouppermission' value='2'/></td>
                               <td><input type="checkbox" name='denygrouppermission' value='-2'/></td>
                             </tr>
                             <tr>
                               <td align="top" class="space_td"><img  style="width: 16px;" src="images/group.png" /> Delete</td>
                               <td><input type="checkbox" name='grouppermission' value='4'/></td>
                               <td><input type="checkbox" name='denygrouppermission' value='-4'/></td>
                             </tr>
                              <tr>
                               <td align="top" class="space_td"><img  style="width: 16px;" src="images/group.png" /> ModifyAccessControl </td>
                               <td><input type="checkbox" name='grouppermission' value='true'/></td>
                               <td><input type="checkbox" name='denygrouppermission' value='false'/></td>
                             </tr>
                              -->
                             
                      </table>
                      	<div class="claer"></div>
                      
                      </div> 
                     <!--  
                      <div class="savePermissions" >
                          <input class='savePermissionsButton' type="button"  value="save" onclick="getValues()"/> 
                      </div> -->
                      <script type="text/javascript">
                      $(document).ready(function() {
                      $('input[name="userpermission"]').click(function(event) {
                    	  var vale=this.value;
                    	  var valu=vale.split(",");
                    	  var user="";
                    	  vale=valu[1];
                    	   if(this.checked) {
                    		  user=valu[0];
                        	  value=valu[1]; 
                    	  }else{
                    		  user=valu[0];
                        	  value="n"+valu[1]; 
                    	  }
                    	  $.ajax({
            					type : "GET",
            					url : "${pageContext.request.contextPath}/assignSinglePermission",
            					data : {
            						'user' : user,
            						'value':value,
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
                    	  
                      }); 
                      });
                      
                      </script>
                  
              </div></div>