<%@page import="edms.wsdl.GetUsersListResponse"%>
<%@page import="edms.webservice.client.UserClient"%>
<%@page import="javax.naming.directory.Attribute"%>
<%@page import="javax.naming.directory.Attributes"%>
<%@page import="javax.naming.directory.DirContext"%>
<%@page import="edms.core.LDAPConnection"%>
<%@page import="edms.core.Config"%>
<%@page import="edms.core.*"%>
<%@page import="java.text.*"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.newcsss{
left: 300px;
    position: absolute;
    top: -42px;
}
</style>
<style type="text/css">

select{
height: 28px;
}
</style>
<link type="text/css" href="css/jquery.datepick.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.plugin.js"></script>
<script type="text/javascript" src="js/jquery.datepick.js"></script>
<!-- <link rel="stylesheet" type="text/css" href="css/autocomplete.css" />
<script src="js/jquery.autocomplete.js"></script> --> 



</head>
<body>
<%
Principal principal=(Principal) request.getAttribute("principal");
HttpSession hs=request.getSession();
String uid=principal.getName();
if(!uid.contains("@"))
{
	uid=uid+Config.EDMS_DOMAIN;
}

String entry=Config.LDAP_BASE+"="+uid+","+Config.LDAP_RDN;
List<String> ulst= LDAPUserList.listLdapUserDirectory(Config.LDAP_URL, entry, principal.getPassword(), Config.LDAP_RDN);
Collections.sort(ulst);
%>
	<div class="form_scolling_project"   id="myformPurPlant">
		<div class="from_main_leave">
				
				 <table id="handleWorkflowForm">
                       <tbody><tr>
				<td rowspan="1">
				<img src="images/logo.png">
				</td>
                <td colspan="3" class="table_heading">INTER OFFICE MEMO
                <input disabled="disabled" type="hidden" value="Inter Office Memo" name="formNameWF" id="formNameWF" /> 
                <input type="hidden"  name="filledDaete" id="filledDaete" />
              
                <input type="hidden"  name="formSStatus"  id="formSStatus" />
                  </td>
              </tr>
              <tr>
                <td>FROM</td>
                <td>
                <%-- <input disabled="disabled"  type="text"  onblur="myVal(this.id)"  id="formBy" name="formBy" readonly="readonly"  class="memo_form" placeholder="FROM" value="<%=uid%>"> --%>
                  <select disabled="disabled"  id="formBy" name="formBy" style="    width: 300px;">
               <option value="index">Please Select </option>
                <%
               for(String lst: ulst)
               {
            	   if(lst.equalsIgnoreCase(uid))
            	   {
               %>
               <option selected="selected" value="<%=lst %>"><%=lst %> </option>
               <%}
            	   else
            	   {
            	   %>
               <option value="<%=lst %>"><%=lst %> </option>
               <%} }%>
               </select>
                
                </td>
                <td>TO</td>
                <td>
                <select disabled="disabled"  id="formTo" name="formTo" style="    width: 300px;">
               <option value="index">Please Select </option>
               <%
               for(String lst: ulst)
               {
               %>
               <option value="<%=lst %>"><%=lst %> </option>
               <%} %>
               </select>
                
                <%-- <input disabled="disabled"  type="text"  onblur="myVal(this.id)"   class="memo_form userforshare" id="formTo" name="formTo" placeholder="FROM" value="<%=uid%>"> --%>
                
                </td>
              </tr>
              <tr>
                <td>OUR REF</td>
                <td><input disabled="disabled"  type="text"  onblur="myVal(this.id)"  class="memo_form" readonly="readonly"   placeholder="OUR REF" id="ourReference"></td>
                <td>YOUR REF</td>
                <td><input disabled="disabled"  type="text"  onblur="myVal(this.id)"  class="memo_form" readonly="readonly"  placeholder="YOUR REF" id="yourReference"></td>
              </tr>
              <tr>
                <td>DATE</td>
                <td><input disabled="disabled"  type="text"  onblur="myVal(this.id)"  placeholder="dd-MM-yyyyy" readonly="readonly"  id="initiatedDate" class="memo_form popupDatepicker"></td>
                <td>DATE</td>
                <td><input disabled="disabled"  type="text"  onblur="myVal(this.id)"  placeholder="dd-MM-yyyy" readonly="readonly"  id="stepDate" class="memo_form popupDatepicker"></td>
              </tr>
              <tr>
                <td colspan="4" class="textarea_div">
                    <textarea  disabled="disabled" id="memoArea" class="memo_textarea" readonly="readonly"   id="memoTextArea"></textarea>
                </td>
              </tr>
               <tr>
              <td colspan="4">Remark:<br>
               <textarea  disabled="disabled" style="height: 69px;  
    width: 100%;" id="remark" readonly="readonly" name="remark"></textarea>
              </td>
              </tr>
             
               <tr>
              
                <td colspan="4">
                <table>
                <tr>
                <td width="10%"> Initiated By</td>
                <td width="85%"><input disabled="disabled"  type="text"  onblur="myVal(this.id)"   style="width: 65% !important; border: 0px;" readonly="readonly"  id="employeeID" name="employeeID"  /></td>
                </tr>
                </table>
               
               
                </td>
              
              </tr>
              
              <tr>
               <td colspan="4">
               <table>
                <tr>
                <td width="10%"> Verified By</td>
                <td width="85%"><input disabled="disabled"  type="text"  onblur="myVal(this.id)"   style="width: 65% !important; border: 0px;" readonly="readonly" value="" id="verifiedBy" name="verifiedBy"  /></td>
                </tr>
                </table>
               
                </td>
              </tr>
              
              <tr>
               <td colspan="4">
                <table>
                <tr>
                <td width="10%"> Approved By</td>
                <td width="85%"><input disabled="disabled"  type="text"  onblur="myVal(this.id)"    style="width: 65% !important; border: 0px;" readonly="readonly" value="" id="approvedBy" name="approvedBy"  /></td>
                </tr>
                </table>
               
                </td>
              </tr>
               <tr>
               <td colspan="4">
                <table>
                <tr>
                <td width="100%">
               
               
               <input disabled="disabled" type="hidden" id="historyHiddenTasks" value="" />
               <div id="showHistoryHiddenTasks" >
            <input  type="button" onclick="getHistoryForms()" class="getHistory" value="Get History" />
               		
               </div>
                  </td>
                </tr>
                </table>
                
				
                </td>
              </tr>
              <tr>
                     	
						<td colspan="4"><input type="hidden" id="attachmentID"
						name="attachmentID"> <input type="button"
						value="Get Attachment" onclick="getAtt()" class="getAttch" />
						<div id="attlch"></div></td>
							
				
					</tr>
              
               <tr>
                 <td colspan="4"><div class="table_right">
                                 
                        
<input  type="button"
								class="Logged_User_tab_color add_user_js add_user_bg"
								value="Print"
								onclick="printDiv()" />
                          </div></td>
              </tr>
              
              
              
              
      
            </tbody>
            </table>
		</div>
	</div>
	
</body>
</html>