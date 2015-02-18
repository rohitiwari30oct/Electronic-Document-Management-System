<%@page import="java.security.Principal"%>
<%@page import="edms.webservice.client.DocumentModuleClient"%>
<%@page import="edms.wsdl.Folder"%>
<%@page import="java.util.List"%>
<%@page import="edms.wsdl.GetFolderResponse"%>
<%@page import="edms.wsdl.HasChildResponse"%>
<%@page import="edms.core.Config"%>

                         <div class="left">
                              <div class="left-pane document_page_left_height new_cheat" >
                                <!---------/// LEFT PART TOP STARTED HERE ---------->
                                      <div class="left_top_part" id="variedPagesHere">
                                      <div class="left_sub_menu">
                                               <ul>
                                                        <li class="file_system tab_header"  id="fileSystem"  onclick="getPage(this.id)"> <a href="#" >MY DOCUMENT</a>
                                                        </li>
                                                        <div class="content_left content_left_block">
                                            <jsp:include page="myDocument.jsp" />
                                             </div>
                                                        <div class="content_left"> </div>
                                             </ul>
                                  </div>
                                      </div>
