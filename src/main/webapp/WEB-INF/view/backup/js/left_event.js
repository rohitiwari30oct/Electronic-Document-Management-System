




// JavaScript Document
// COMMON CLASS Only LEFT  PORTION



//COMMON FOR RIGHT PORTION
//$(document).ready(function() {
	
    
//});


// COMMON FOR MIDDLE PORTION
//$(document).ready(function() {$('.middle_tab').click(function(){
//var opend = true;
//if($(this).find('.icon_folder').attr('class').indexOf('folderminus')>-1);
//{opend=false;
//}
//$('.row_content').css('display','block');
//$('.icon_folder').removeClass('folderminus');
//$('.icon_folder').removeClass('folderplus');
//if(opend){
//$(this).next().next().css('display','block');
//$(this).find('.icon_folder').addClass('folderminus');}
// else
//  {$(this).next().next().css('display','none');
//$(this).find('.icon_folder').addClass('folderplus');} }
//	);
//	
//});


// COMMON FOR MIDDLE PORTION
//$(document).ready(function() {

    

//});

// TILE VIEW 
function tile_view(){
	
	$('.thum_view_middle').css('display','block');
	$('.thum_view').addClass('color_thum_icon');
	$('.list_view').removeClass('color_list_icon');
	$('.list_view_middle').css('display','none');
	$('.thum_view').removeClass('color_tile_icon');
	}
	function list_view(){
	
	$('.list_view_middle').css('display','block');
	$('.thum_view_middle').css('display','none');
	$('.list_view').addClass('color_list_icon');
	$('.thum_view').addClass('color_tile_icon');
	$('.thum_view').removeClass('color_thum_icon');
	
	}


//LEFT PART STARTED HERE

	
	function icon_1(){
				
				if($('.content_left_1').css('display')=='none')
				
						{
							$('.content_left').css('display','none');
							$('.content_left_1').css('display','block');
							$('.icon_1').addClass('icon_minus');
							$('.icon_1').removeClass('icon_plus');
							
						}
						
				else 
						{
							
							$('.content_left_1').css('display','none');
							$('.icon_1').removeClass('icon_minus');
							$('.icon_1').addClass('icon_plus');
							$('.content_left').css('display','none');
							
						}		
	
	}






// RIGHT PART MENU ONLY STARTED HERE
function icon_right(){
	
	if($('.content_right').css('display')=='none')
	{
		$('.content_right').css('display','block');
		$('.icon_right').addClass('icon_right_minus');
		$('.icon_right').removeClass('icon_right_plus');
		
		
		}
	else {
		
		$('.content_right').css('display','none');
		$('.icon_right').removeClass('icon_right_minus');
		$('.icon_right').addClass('icon_right_plus');
		
		
		}
	
	
	}
	
	/// MID FOLDER EVENT STARTED HERE 
	function folder_icon(){
		
		if($('.row_content').css('display')=='block')
		
		     {
			     $('.row_content').css('display','none');
				 $('.icon_folder').removeClass('folderminus');
				  $('.icon_folder').addClass('folderplus');
			
			    }
				
				else {
					
			     $('.row_content').css('display','block');
				 $('.icon_folder').removeClass('folderplus');
				 $('.icon_folder').addClass('folderminus');
					
					
					}
		
		
		
		}
		
		/// Bottom here 
function bottom_view(){
	
	if($('.bottom').css('display')=='none')
	{
		$('.list_view_middle').addClass('new_tile_with');
		$('.bottom_view').addClass('bottom_view_color');
		$('.right_view').removeClass('right_view_color');
		$('.middle-pane').css('display','none');
		$('.right-pane').css('display','none');
		$('.bottom').css('display','block')
		$('.right_left_part').removeClass('left_border_star');
		$('.right-pane').css('display','none');
	    $('.only_left_icon').addClass('hide_left');
	     $('.thum_view_middle').removeClass('new_width');
		
		}
		else{
		$('.middle-pane').css('display','none');
		$('.right-pane').css('display','none');
		$('.bottom').css('display','block')
		$('.right_left_part').removeClass('left_border_star');
		$('.right-pane').css('display','none');

	
		
		}
	
	
	}
	
	/// LEFT VIEW 
	function left_view(){
	if($('.bottom').css('display')=='block')
	{
		    $('.list_view_middle').removeClass('new_tile_with');
		    $('.bottom').css('display','none')
			$('.right-pane').css('display','block');
		    $('.middle-pane').css('display','block');
			$('.right_left_part').addClass('left_border_star');
           $('.only_left_icon').removeClass('hide_left');
		    $('.right_view').addClass('right_view_color');
			$('.bottom_view').removeClass('bottom_view_color');
			$('.thum_view_middle').addClass('new_width')
		}
	
	
	}
	
	/// FOR CHEAT OPTION 
	function tab_left(){
		
	/*	if($('#test').css('display')=="block")
		{
			    $('#test').addClass('cheat_height_big');
				$('#test').removeClass('cheat_height_small');
			}
			else{
				
				
					$('#test').addClass('cheat_height_small');
			        $('#test').removeClass('cheat_height_big');
				
				
				} */
				$('#test').toggleClass('cheat_height_big');
				$('#test').toggleClass('cheat_height_small');

		}
		
		
		function tab_arrow(){
			
			if($('.tab_container').css('display')=='block')
			    {
					$('.arrow_tab').addClass('icon_change_close');
					$('.arrow_tab').removeClass('icon_change_open');
					$('.left-pane').addClass('new_height');
					$('.tabs').addClass('top_space');
					$('.tab_container').addClass('close');
					$('.tab_container').removeClass('open');
				    $('.active').css('border-bottom','1px solid #ccc')
					$('.bottom_icon').css('height','490');
					$('.bottom').css('height','498');
					$('.left-pane').addClass('new_height');
	
				}
				
				else 
				{      
				$('.tabs').addClass('top_space');

					$('.arrow_tab').addClass('icon_change_close');
                    $('.arrow_tab').addClass('icon_change_open');
                    $('.tab_container').removeClass('close');
					$('.left-pane').removeClass('new_height');
					$('.tab_container').animate({'height':'209px'},2000);
					//alert("hjuj");
					$('.active').css('border-bottom','1px solid #fff');
					$('.bottom_icon').css('height','300')
					$('.bottom').css('height','300');
					$('.tabs').removeClass('top_space');
				
			    }
			
			
			
			}
			
			
			// LEFT ICON ONLY STARTED HERE 
			
			function left_icon()
			{
	
				if($('.right-pane').css('display')=='block')
				{
					
					$('.right_icon_main').addClass('only_icon');
						$('.right_icon_main').removeClass('icon_descri');
						$('.thum_view_middle').css('margin-right','91')
						$('.thum_view_middle').addClass('for_margin');
						$('.middle-pane').addClass('cover_space');
                        $('.only_left_icon').removeClass('hide_left');
						    $('.thum_view_middle').removeClass('new_width');
							
					}
					
					else {
					$('.right_icon_main').removeClass('only_icon');
					$('.right_icon_main').addClass('icon_descri');
					$('.thum_view_middle').removeClass('for_margin');
					$('.middle-pane').removeClass('cover_space');
					 $('.only_left_icon').removeClass('hide_left');
					 $('.thum_view_middle').addClass('new_width');
						}
				
				
				}
				
				function setting(){
				if($('.list_menu').css('display')=='block')
				   {
					  $('.list_menu').css('display','none');
					
				   }
				   else {
					   
					   $('.list_menu').css('display','block');
					   
					   }
					
					}
					
					
					// Search Here 
					function search_1(){
						
						
						
						}
						
						
			// Basic Tab 
			
			function basic_tab(){
				
				if($('.basic_content').css('display')=='block')
				{
					$('.basic_content').css('display','block');
					$('.basic').addClass('bg_color');
                    $('.basic_content').css('display','block')
					}
					else
					{
						$('.basic').removeClass('bg_color');
						}
				
				}		
				
				function basic_tab_close(){
				
				if($('.basic_content').css('display')=='none')
				{
					$('.basic_content').css('display','block');
					$('.basic').addClass('bg_color');
					}
					else
					{
						$('.basic').removeClass('bg_color');
						}
				
				}
				///Advanced Here 
				function advanced_tab(){
				
				if($('.advanced_content').css('display')=='none')
				{
					$('.advanced_content').css('display','block');
					$('.advanced').addClass('bg_color');
					$('.basic_content').css('display','none')

					}
					else
					{
						$('.advanced').removeClass('bg_color');
						}
				
				}	
				
			function tab_search(){
				if($('.search_box_details').css('display')=='none')
				{
					
					$('.search_box_details').css('display','block')
					
					}
				else
				{
					
					$('.search_box_details').css('display','none')
					
					}
				}
				
				

				
				/// For Chat Option Only Started Here 
$(document).ready(function() {
	//Top
	$('.right_tab').click( function(){
	
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
				  $(this).next('.content_right').css('display','none')
				  
				  }
			  
		  
	}
	);
	
	//Middle
	$('.middle_tab').click(
            function() {

                var opend = true;
                if ($(this).find('.icon_folder').attr('class').indexOf('folderminus') > -1)
                {
                    opend = false;
                }
                $('.row_content').css('display', 'block');
                $('.icon_folder').removeClass('folderminus');
                $('.icon_folder').removeClass('folderplus');
                if (opend) {
                    $(this).next().next().css('display', 'block');
                    $(this).find('.icon_folder').addClass('folderminus');
                } else {
                    $(this).next().next().css('display', 'none');
                    $(this).find('.icon_folder').addClass('folderplus');
                }

            }



    );
	
	
	
	///SHARED FOLDER ONLY
	$('.shared_event').click(function(){
		
	       if($('.shared_tab').css('display')=='none')
		   {
			   $('.shared_tab').css('display','block');
               $('.all_form_tab').css('display','none');
			    $('.trash_tab').css('display','none');
			   }
		});
		
		
		
			///TRASH PAGES ONLY
					$('.trash').click(function(){
						
						   if($('.trash_tab').css('display')=='none')
						   {
							   $('.shared_tab').css('display','none');
							   $('.trash_tab').css('display','block');
							   $('.all_form_tab').css('display','none');
							   }
						
						});
						
						
						
		/// FROM TAB STARED HERE 
		$('.table_menu').click(function(){
			     if($('.shared_trash').css('display')=='block')
				 {
					 
					        $('.shared_tab').css('display','none');
						    $('.trash_tab').css('display','none');
							$('.all_form_tab').css('display','block');
							$('.user_static_7').removeClass('first_tab')
					 
					 
					 }
			
			
			
			
			});
	

	
	//Bottom
	var adjustChatHeight;
    $('.tab_header').click(function() { 
        var opend = false;
        if ($(this).find('.icon').attr('class').indexOf('icon_minus') > -1) {
            opend = true;
        }
        $('.content_left').css('display', 'none');
        $('.icon').removeClass('icon_minus');
        $('.icon').removeClass('icon_plus');
        if (!opend) {
            $(this).find('.icon').addClass('icon_minus');
            $(this).next('.content_left').css('display', 'block');
			
			// adjust the height of lower chat div
			var chat_search_top = $('.chat_inner_content').offset().top + $('.chat_inner_content').height();
			var chat_search_1 = window.innerHeight + window.scrollY;             		
			adjustChatHeight = chat_search_top - chat_search_1;
			$('.chat_inner_content').css({height:($('.chat_inner_content').height() - adjustChatHeight)});			
			$('.chat_inner_content').css("overflow", "auto");
        } else {
            $(this).find('.icon').addClass('icon_plus');
            $(this).next('.content_left').css('display', 'none');
			
			//adjust height of lower chat div back when collapsed
			$('.chat_inner_content').css({height:($('.chat_inner_content').height() + adjustChatHeight)});			
			$('.chat_inner_content').css("overflow", "hidden");
        }
		
		var chat_search_top = $('.chat_box_inner').offset().top + $('.chat_box_inner').height();
		var chat_search_1 = window.innerHeight + window.scrollY;             		
		var adjustHeight = chat_search_top - chat_search_1;
		//$('.chat_box_inner').height() = $('.chat_box_inner').height() - adjustHeight;
				
    });
	$('.document_library').click(function() {
			$('#test').toggleClass('cheat_height_small');
			$('#test').toggleClass('cheat_height_big');			
	});
	
	// Folder View,List View,Left View,Bottom View
	$('.user_images').click(function(){
		
		if($('.uparrowdiv').css('display')=='none')
		{
			$('.uparrowdiv').css('display','block');
			
		}
		else{
			$('.uparrowdiv').css('display','none');
				
		}
		
		  

		});
		
		
		///Appoment Tab Started Here 
		
			$('.tab_menu_1').click(function() {
			if($('.appoment_tab_1').css('display')=='none')
			{
				$('.appoment_tab_2').css('display','none');
				$('.tab_menu_1').addClass('tab_menu_1_bg')
				$('.appoment_tab_1').css('display','block');
				$('.tab_menu_2').removeClass('tab_menu_2_bg');
				
				}		
	});
	
			$('.tab_menu_2').click(function() {
			if($('.appoment_tab_2').css('display')=='none')
			{
				$('.appoment_tab_2').css('display','block');
				$('.appoment_tab_1').css('display','none');
				$('.tab_menu_1').removeClass('tab_menu_1_bg');
				$('.tab_menu_2').addClass('tab_menu_2_bg');
				}		
	});
	
	
	
	
	
	/// Add New User 
	
	  $('.add_user_js').click(function(){
		     
				   if($('.add_user_content').css('display')=='block')
				   {
					    $('ul.nextpre').css('display','none');
				       $('.add_user_content').css('display','block');
					   $('.add_user_js').addClass('add_user_bg');
					   $('.loged_user_content').css('display','none');
					   $('.logged_user_js').removeClass('log_user_bg');
					   $('.User_List_js').removeClass('user_list_bg');
					   $('.User_List_content').css('display','none');
					   $('.user_profile_content').css('display','none');
					   $('.user_profile_js').removeClass('user_profile_bg');
					   $('.mini_type_content').css('display','none');
					   $('.mini_type_js').removeClass('mini_type_bg');
					     $('.group_List_content').css('display','none');
					 $('.group_List_js').removeClass('group_user_bg');
					 $('.user_profile_content').css('display','none');
					 $('.new_edite_from ').css('display','none');
					 $('.edite_user_profile"').css('display','none');
					   $('.new_edit_pages').css('display','none');
				

				   }
				   else{
					    $('ul.nextpre').css('display','none');
					    $('.add_user_content').css('display','block');
						 $('.add_user_js').addClass('add_user_bg');
					    $('.loged_user_content').css('display','none');
						$('.logged_user_js').removeClass('log_user_bg');
						$('.user_profile_js').removeClass('user_profile_bg');
						$('.user_profile_content').css('display','none');
						$('.User_List_js').removeClass('user_list_bg');
						$('.User_List_content').css('display','none');
						$('.logged_page_current').css('display','block');
						$('.logged_page_profile').css('display','none');
				        $('.logged_page_list').css('display','none');
						  $('.group_List_content').css('display','none');
					 $('.group_List_js').removeClass('group_user_bg');
					 $('.user_profile_content').css('display','none');
						
					   $('.new_edit_pages').css('display','none');
					   
					   }
	
		      });
	
	//Loged User Tab Stared Here 
	   //Loged User 
	   
			   
            $('.logged_user_js').click(function(){
		       	
				   if($('.loged_user_content').css('display')=='none')
				   { 
				       $('ul.nextpre').css('display','block');
				       $('.add_user_js').removeClass('add_user_bg');
					   $('.loged_user_content').css('display','block');
					   $('.logged_user_js').addClass('log_user_bg');
					   $('.User_List_js').removeClass('user_list_bg');
					   $('.User_List_content').css('display','none');
					   $('.user_profile_content').css('display','none');
					   $('.user_profile_js').removeClass('user_profile_bg');
					   $('.mini_type_content').css('display','none');
					   $('.mini_type_js').removeClass('mini_type_bg');
				       $('.add_user_content').css('display','none');
					     $('.group_List_content').css('display','none');
					 $('.group_List_js').removeClass('group_user_bg');
                     $('.user_profile_content').css('display','none');
					   $('.new_edit_pages').css('display','none');
				   }
	
		      });
			  
			  
			  
			  //// MORE OPTION STARED HERE 
			  $('.more_click').click(function()
			  {
				  if($('.more_option_event').css('display')=='none')
				  {
					  $('.header_menu').css('display','block');
					  $('.more_click').removeClass('active');
					  }
					  else{
						  
						  $('.header_menu').css('display','none');
						  
						  }
				  
				  
				  });
				  
				  
				  
				  $('.remove_menu').click(function()
				  {
					  
					  if($('.more_option_event').css('display')=='block')
					  {
							$('.full_width').addClass('add_margin');
							$('.main_statical').addClass('add_margin');
							$('.tab_mid').addClass('add_margin');
					  }
					  }
				  );
				  
				  
				  /// Tab Calender 
				  $('.calender_box').click( function(){
					  
					  $('.calender_div').addClass('calender_images')
					  
					  
					  
					  });
				  
				  
				    $('.remove_menu').click(function()
				  {
				  
				  	if($('.more_option_event').css('display')=='none')
					 {
						  
						   	$('.main_statical').removeClass('add_margin');
							$('.tab_mid').removeClass('add_margin');
						  }
	                	  }
				  );
	    
	   //User List
	   
	   	   	$('.User_List_js').click(function(){
		
		       if($('.User_List_content').css('display')=='none')
			   {
				   
				   $('ul.nextpre').css('display','block');
				   $('.add_user_js').removeClass('add_user_bg');
				   $('.User_List_content').css('display','block');
				   $('.User_List_js').addClass('user_list_bg');
				   $('.loged_user_content').css('display','none');
				   $('.logged_user_js').removeClass('log_user_bg');
				   $('.user_profile_content').css('display','none');
				   $('.user_profile_js').removeClass('user_profile_bg');
				   $('.mini_type_content').css('display','none');
				   $('.mini_type_js').removeClass('mini_type_bg');
				   $('.logged_page_profile').css('display','none');
				   $('.logged_page_list').css('display','block');
				   $('.logged_page_current').css('display','none');
				   $('.add_user_content').css('display','none');
                   $('.edite_user_profile').css('display','none');
				     $('.group_List_content').css('display','none');
					 $('.group_List_js').removeClass('group_user_bg');
					 $('.user_profile_content').css('display','none');
					   $('.new_edit_pages').css('display','none');
				   }
				   
				      
			
	
		});
		
		
		
			   //Group List
	   
	   	   	$('.group_List_js').click(function(){

		       if($('.group_List_content').css('display')=='none')
			   {
				           $('ul.nextpre').css('display','block');
						   $('.add_user_js').removeClass('add_user_bg');
						   $('.User_List_content').css('display','none');
						   $('.group_List_content').css('display','block');
						   $('.add_user_content').css('display','none');
						   $('.group_List_js').addClass('group_user_bg');
						   $('.User_List_js').removeClass('user_list_bg');
						   $('.edite_user_profile').css('display','none');
						   $('.user_profile_content').css('display','none');
						   $('.loged_user_content').css('display','none');
						     $('.new_edit_pages').css('display','none');
						   $('.logged_user_js').removeClass('log_user_bg');
				   }

		});
	   
	   
	   
	   //User Profile
	          
			     	   	$('.user_profile_js').click(function(){
		
		       if($('.user_profile_content').css('display')=='none')
			   {
				   $('.add_user_js').removeClass('add_user_bg');
				   $('.user_profile_content').css('display','block');
				   $('.user_profile_js').addClass('user_profile_bg')
				   $('.User_List_content').css('display','none');
				   $('.User_List_js').removeClass('user_list_bg');
				   $('.loged_user_content').css('display','none');
				   $('.logged_user_js').removeClass('log_user_bg');
				   $('.mini_type_content').css('display','none');
				   $('.mini_type_js').removeClass('mini_type_bg');
				   $('.logged_page_profile').css('display','block');
				   $('.logged_page_list').css('display','none');
				   $('.logged_page_current').css('display','none');
				   $('.add_user_content').css('display','none');
                      $('.new_edit_pages').css('display','none');
				   }
	
		       });
	   
	    
	   // Mini Type 
	
	         
			   $('.mini_type_js').click(function(){
		
		       if($('.mini_type_content').css('display')=='none')
			   {
				   $('.add_user_js').removeClass('add_user_bg');
				   $('.mini_type_content').css('display','block');
				   $('.mini_type_js').addClass('mini_type_bg');
				   $('.user_profile_content').css('display','none');
				   $('.user_profile_js').removeClass('user_profile_bg')
				   $('.User_List_content').css('display','none');
				   $('.User_List_js').removeClass('user_list_bg');
				   $('.loged_user_content').css('display','none');
				   $('.logged_user_js').removeClass('log_user_bg');
				   $('.add_user_content').css('display','none');
                    $('.user_profile_content').css('display','none');
				   }
	
		       });
			   
			   
		// Mini Type 
	
	         
			   $('.large_name').click(function(){
		       if($('.user_profile_content').css('display')=='none')
			   {
				   $('.user_profile_content').css('display','block');
				   $('.add_user_js').removeClass('add_user_bg');
				   $('.user_profile_content').css('display','block');
				   $('.user_profile_js').addClass('user_profile_bg')
				   $('.User_List_content').css('display','none');
				   $('.User_List_js').removeClass('user_list_bg');
				   $('.loged_user_content').css('display','none');
				   $('.logged_user_js').removeClass('log_user_bg');
				   $('.mini_type_content').css('display','none');
				   $('.mini_type_js').removeClass('mini_type_bg');
				   $('.logged_page_profile').css('display','block');
				   $('.logged_page_list').css('display','none');
				   $('.logged_page_current').css('display','none');
				   $('.add_user_content').css('display','none');
				        $('.group_List_content').css('display','none');
					 $('.group_List_js').removeClass('group_user_bg');
                    $('.new_edit_pages').css('display','none');
				   }
	
		       });
			   
			   
			   /// EDIT USER PAGES PROFILE (ADMIN PORTION)
			   $('.edit_user').click(function()
			   {
			
				   if($('.new_edit_pages').css('display')=='none'){
							 $('.new_edit_pages').css('display','block');
							 $('.user_profile_content').css('display','none');
							      $('.group_List_content').css('display','none');
					 $('.group_List_js').removeClass('group_user_bg');
					 $('.edit_user').css('display','none');
					 $('.user_profile_content').css('display','none');
				   }});
		          
			/// Delete Pages EDITE PAGE ONLY 
			
			     $('.delete_new_user').click( function(){
					 					confirm('Are You Sure !')
						  $('.new_edit_pages').css('display','none');
						 
						 }
				 
				 );
			
			
				  
			   
			   	   /// EDIT USER PAGES PROFILE (ADMIN PORTION LIST)
				   /*
				   $('.del_edt_del').click(function()
				   {
					   
					   if($('.User_List_content').css('display')=='block'){
								 $('.edite_user_profile').css('display','block');
								 $('.user_profile_content').css('display','none');
								 $('.User_List_content').css('display','none')
								 $('.User_List_js').removeClass('user_list_bg');
								      $('.group_List_content').css('display','none');
					 $('.group_List_js').removeClass('group_user_bg');
					   }});
					   
					 */  
					   
	
			   
			   
			   /// DELETE USER PROFILE PAGE EDITE (ADMIN)
			   
                $('.delete_user').click(function()
				
				{
					
					confirm('Are You Sure !')
					
					if($('.edite_user_profile').css('display')=='block')
					{
						
						$('.edite_user_profile').css('display','none');
						$('.delete_user_info').css('display','block');
						     $('.group_List_content').css('display','none');
					 $('.group_List_js').removeClass('group_user_bg');

						}});	
						
						/// NEW EDIT PAGES 
					  $('.new_edit').click(function(){
					
						  if($('.new_edit_pages').css('display')=='none')
						  {
							  $('.new_edit_pages').css('display','block');
					          $('.User_List_content').css('display','none')
							  $('.User_List_js').removeClass('user_list_bg');
							  	 $('.user_profile_content').css('display','none');
							 }
						  });
						  
						  
						  
						  
						  		/// NEW EDIT PAGES  WHEN PROFILE PAGES VISIT
					  $('.edit_user').click(function(){
					
						  if($('.new_edit_pages').css('display')=='none')
						  {
							  $('.new_edit_pages').css('display','block');
					          $('.User_List_content').css('display','none')
							  $('.User_List_js').removeClass('user_list_bg');
							 }
						  });
						
						
						  /// DELETE USER PROFILE PAGE (ADMIN)
			   
                $('.delete_user_1').click(function()
				
				{
					
					confirm('Are You Sure !')
					
					if($('.user_profile_content').css('display')=='block')
					{
						
						$('.user_profile_content').css('display','none');
						$('.delete_user_info').css('display','block');
						     $('.group_List_content').css('display','none');
					 $('.group_List_js').removeClass('group_user_bg');

						}});	

				/// CANCEL THE USER PROFILE EDITE (ADMIN)
				$('.cancel_user_profile').click(function()
				
				{
					   if($('.user_profile_content').css('display')=='none')
					   {
						   
						   
						   
						    $('.edite_user_profile').css('display','none');
							 $('.user_profile_content').css('display','block');
							      $('.group_List_content').css('display','none');
					 $('.group_List_js').removeClass('group_user_bg');
						   }});
						 
				/// PROFILE PAGES TO EDITE PAGES
				$('.edit_user').click(function(){
					
					if($('.edit_user').css('display')=='none')
					{
						
						
						}
					
					
					
					});		   
						
						
				/// SHARED FOLDER STARTED HERE 
				$('.shared_option').click(function(){
					
					if($('.hindden_tab_22').css('display')=='none'){
						
						$('.hindden_tab_22').css('display','block');
						
						}
					else{
						  $('.hindden_tab_22').css('display','none');
						
						}
					
					
					
					});  
			   
			   
	
			   
			   
			   /// Select option Here 
			   $('.heading').click(function()
			   
			       {
					   if($('.hindden_tab').css('display')=='none')
					   {
						   $('.hindden_tab').css('display','block');

						   }
					   }
			   );
			   
			   	   /// Select option Here 
			   $('.heading').click(function()
			   
			       {
					   if($('.hindden_tab').css('display')=='none')
					   {
						   $('.hindden_tab').css('display','block');

						   }
					   }
			   );
			   
			   
			   
			   
			   $('.folder_icon').click(function()
			   {
				
				   $('.home').addClass('color_home');

				   });
				   
				   
				$(document).mouseup(function (e)
				{
					
					var container = $(".uparrowdiv");
				       if(container != undefined && e.target != undefined  && container.has != undefined){
						   
								  if (!container.is(e.target) && container.has(e.target).length === 0) 
								  {
									  container.hide();
								  }
					
					   }
					   
				});

});




//// POP UP BOX FOR SELECT (ACTIVE AND DEACTIVE)
function myFunction() {
    var x;
    if (confirm("Are you sure!") == true) {
		
		$('.active_icon').addClass('color_active');
		$('.deactive_icon').removeClass('color_deactive');
   
    }

}

function myFunction_decative() {
    var x;
    if (confirm("Are you sure!") == true) {
		
		$('.deactive_icon').addClass('color_deactive');
		$('.active_icon').removeClass('color_active');
   
    }

}

// POP UP BOX FOR ADD USER 

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
/*
/// SELECT ALL CHECK BOX 
function addRow(tableID) {

     var table = document.getElementById(tableID);

     var rowCount = table.rows.length;
     var row = table.insertRow(rowCount);

     var cell1 = row.insertCell(0);
     var element1 = document.createElement("input");
     element1.type = "checkbox";
     element1.name = "chkbox[]";
     cell1.appendChild(element1);

     var cell2 = row.insertCell(1);
     cell2.innerHTML = rowCount;

     var cell3 = row.insertCell(2);
     cell3.innerHTML = rowCount;

     var cell4 = row.insertCell(3);
     cell4.innerHTML = rowCount;

     var cell5 = row.insertCell(4);
     cell5.innerHTML = rowCount;

     var cell6 = row.insertCell(5);
     cell6.innerHTML = rowCount;
 }

 function deleteRow(tableID) {
     try {
         var table = document.getElementById(tableID);
         var rowCount = table.rows.length;

         for (var i = 1; i < rowCount; i++) {
             var row = table.rows[i];
             var chkbox = row.cells[0].childNodes[0];
             if (null != chkbox && true == chkbox.checked) {
                 table.deleteRow(i);
                 rowCount--;
                 i--;
             }
         }
     } catch (e) {
       
     }
 }
*/



/*
 function checkAll(ele) {
     var checkboxes = document.getElementsByTagName('input');
     if (ele.checked) {
         for (var i = 0; i < checkboxes.length; i++) {
             if (checkboxes[i].type == 'checkbox') {
                 checkboxes[i].checked = true;
             }
         }
     } else {
         for (var i = 0; i < checkboxes.length; i++) {
             console.log(i)
             if (checkboxes[i].type == 'checkbox') {
                 checkboxes[i].checked = false;
             }
         }
     }
 }
*/ 

/// FOR CHAT ON OPEN WINDOW 
//$('.chaet_option').mouseover(
//function(){
	
	//alert($(this).offset().top)
	
	
//	}


//)
 

