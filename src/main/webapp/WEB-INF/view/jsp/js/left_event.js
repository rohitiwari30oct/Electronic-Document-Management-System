

/*@@@@@ 

        ******************************************
        ************************************
               LEFT EVENT STARTED  HERE   
	    ************************************
		******************************************
			   
@@@@@@*/

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
			     //$('.row_content').css('display','none');
				   $('.row_content').removeClass('show_content');
			       $(this).addClass('show_content');
				 //  $('.update').addClass('select_icon');
				 
				 
				 $(this).hide();
				 $('.icon_folder').removeClass('folderminus');
				  $('.icon_folder').addClass('folderplus');
			
			    }
				
				//else {
					
			   //  //$('.row_content').css('display','block');
				//// $(this).show();
				 $('.icon_folder').removeClass('folderplus');
				// $('.icon_folder').addClass('folderminus');
					
					
					//}
		//
		
		
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
				


				
				
				

				
				/// For Chat Option Only Started Here 
				
				//for responsiveness of screens
$(document).ready(function() {
	
	   ///SELECT BOX EVENT STARTED HERE
	       var removeClass = true; 

	   	$(document).on("click",".select_box",function(event){
	   		event.stopPropagation();
			        $('li.new_select_box').removeClass('new_select_box');
			        $('ul.new_select_box').removeClass('new_select_box');
			        $(this).addClass('new_select_box');
					$('.update').addClass('select_icon');
					var get_cl = $('.select_box').find('new_select_box');
					  /// TEST STRED HERE 
				    if($('.select_box').find('new_select_box'))
					{
						//alert('Hi');
						$('.menu_right >ul >li').addClass('act_me');
						
						
						} 
				   
				   /// TEST END HERE 
					
					
					removeClass = false;
					//$(this).css('background','#ccc');

			   });
			   
			   
			   /// TEST STRED HERE 

	   /*	$(document).on("click",".serach_top >span",function(){
				//removeClass = false;
				alert('Hi')
				  if($('.search_box_details').css('display')=='none')
				       {
					
					        $('.search_box_details').css('display','block');
					
					   }
				     else
				      {
					
					      $('.search_box_details').css('display','none');
					 
					  }
					
					
			    });*/
			   
			
			   
			   /// TEST STRED END HERE
			   
			   
			   
			  
			//$("html").click(function () {
           //   if (removeClass) 
			  //    {
					  // FOR STELECT BOX
              //     $('.select_box').removeClass('new_select_box');
				//   $('.menu_right >ul >li').removeClass('act_me');
				     /// FOR SELECT BOX END 
			//	   $('.update').removeClass('select_icon');
			//	   $('.search_box_details').css('display','none');
             //     }
            //      removeClass = true;
            //      });
	
	
	/// SHARED OPTION HERE 
	      // SHARED ICON
	   	$(document).on("click",".share",function(){
			       
				   if($('.share_option').css('display')=='none')
				   
				   {
					   $('.share_option').css('display','block');
					   $('.web_dialog_overlay').css('display','block');
					   
					   }
				   
			  
			  });    
		
		///    Cancel POP Up END HERE 

	   	$(document).on("click",".cancel_popup",function(){
			
			         if($('.share_option').css('display')=='block')
				   
				   {
					   $('.share_option').css('display','none');
					   $('.web_dialog_overlay').css('display','none');
					   
					   }
			
			
			});
			  
	    
	
	    // USER SHERED 
	   	$(document).on("click",".user_option",function(){
			        
					if($('.user_inner').css('display')=='none')
					{
						
						$('.user_inner').css('display','block');
						$('.user_option').addClass('user_select');
						$('.group_inner').css('display','none');
						$('.user_group').removeClass('group_select');
						$('.user_details').addClass('permissions_user');
						$('.group_details').removeClass('permissions_group');
						 $('.user_details').removeClass('permi_user_display');
				    }
			   
			   });
			   
		/// Group Shared Option

	   	$(document).on("click",".user_group",function(){

			     if($('.group_inner').css('display')=='none')
				 {
					 $('.group_inner').css('display','block');
					 $('.user_group').addClass('group_select');
					 $('.user_option').removeClass('user_select');
					 $('.user_inner').css('display','none');
					 $('.user_details').removeClass('permissions_user');
					 $('.group_details').addClass('permissions_group');
					 $('.user_details').addClass('permi_user_display');
					 }
					 
			   
			   });
			   
	
	
	// LEFT PART DOCUMENT ONCLICK
	   	
		// LEFT PART DOCUMENT ONCLICK
	   	$('.subfolder_sign').click(function(){
	   	//alert('Hi-Hi');
	   	$('div.Hi').removeClass('Hi');
	   	$(this).addClass('Hi')
	   	$(this).parent().children('.subfolder_onhover').slideToggle();
	   	$(this).toggleClass('open_file');
//	   		$(this).parent().children('.subfolder_onhover').toggleClass('open_file');

	   	});
	   	
/* 	$(document).on("click",".content_left_block > ul >li",function(){
	
      if($('.subfolder_onhover').css('display')=='none')
	  {
		  $('.subfolder_onhover').addClass('subfolder_open');
		  $('.subfolder_sign').addClass('subfolder_minus');

      }
	  else
	  {
		  $('.subfolder_onhover').removeClass('subfolder_open');
		  $('.subfolder_sign').removeClass('subfolder_minus');
	  }
	
	
	});*/

/// WINDOW HEIGHT AND WIDTH 
  		z=$(window).width();
		x= z-231;
		y= $(window).height();
		r= $(window).height()-169;
		$('.content_left').css('height',y-322);
		//$('.left_bottom_part').css('top',y-292);
		w=y/2;
		$('.main_div').css('width',z);
		$('.right').css('width',x);
		$('.head').css('width',x);
		$('.menu_right').css('width',x);
		$('.left').css('height',y-66);	
		$('.header').css('width',z)
		//$('.left_bottom_part').css('height',w)
		//$('.left_bottom_part').css('top',w);
		$('.form_scolling_project').css('height-66',r)
		//$('.right').css('height',y);
/*$(window).resize( function(){
	    z=$(window).width();
		x= z-231;
			w=y/2;
		$('.left_top_part').css('height',y/2);
		y= $(window).height()-69 ;
		$('.main_div').css('width',z);
		$('.right').css('width',x);
		$('.head').css('width',x);
		$('.menu_right').css('width',x);
		$('.left').css('height',y);	
		$('.header').css('width',z);
		$('.left_bottom_part').css('height',w);
		$('.left_bottom_part').css('top',w);
		$('.form_scolling_project').css('height',r)
		//$('.right').css('height',y);
		/*var margin_menu_left = $( '.menu_right>ul>li' ).css( "margin-left" );
		margin_menu_left=parseInt(margin_menu_left);
		var margin_menu_right = $( '.menu_right>ul>li' ).css( "margin-right" );
		margin_menu_right=parseInt(margin_menu_right);
		
		$('.menu_right>ul>li').css('margin-left',(margin_menu_left-3));
		$('.menu_right>ul>li').css('margin-right',(margin_menu_right-3));
			*/
/* });*/
//end resp...


	// NEW CHAT HEIGHT CURRENT
	//$('.icon').click(function(){
		
		//	if($('.content_left').css('display')=='none')
		//	{
		//				$('.left_top_part').css('height','60%');
				//		$('.left_bottom_part').css('height','40%');
				//		$('.left_bottom_part').css('top','60%');
		//	}
		//	else{
				   //     $('.left_top_part').css('height','50%');
					//    $('.left_bottom_part').css('height','60%');
			//		//	$('.left_bottom_part').css('top','40%');
			//	}

		
   //   });
	
	
	
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
				  $(this).next('.content_right').css('display','none')
				  
				  }
			  
		  
	}
	);
	
	//Middle
	   	$(document).on("click",".middle_tab",function(){

                var opend = true;
                if ($(this).find('.icon_folder').attr('class').indexOf('folderminus') > -1)
                {
                    opend = false;
                }
               // $('.row_content').addClass('show_content');
				// $('.row_content').hide(this);
				$('.row_content_11').css('display', 'block');
                $('.icon_folder').removeClass('folderminus');
                $('.icon_folder').removeClass('folderplus');
                if (opend) {
                    $(this).next().next().css('display', 'block');
                    $(this).find('.icon_folder').addClass('folderminus');
                } 
				else {
                    $(this).next().next().css('display', 'none');
                    $(this).find('.icon_folder').addClass('folderplus');
					$('.row_content').removeClass('show_content');
                }

            }



    );
	
	
	
	///SHARED FOLDER ONLY
	   	$(document).on("click",".shared_event",function(){
		
	       if($('.shared_tab').css('display')=='none')
		   {
			   $('.shared_tab').css('display','block');
               $('.all_form_tab').css('display','none');
			    $('.trash_tab').css('display','none');
			   }
		});
		
		
		
			///TRASH PAGES ONLY
	   	$(document).on("click",".trash",function(){
						
						   if($('.trash_tab').css('display')=='none')
						   {
							   $('.shared_tab').css('display','none');
							   $('.trash_tab').css('display','block');
							   $('.all_form_tab').css('display','none');
							   }
						
						});
						
						
						
		/// FROM TAB STARED HERE 
	   	$(document).on("click",".table_menu",function(){
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
/*    $('.tab_header').click(function() { 
        var opend = false;
        var ttt=$(this).find('.icon').attr('class');
        var tttt=ttt.indexOf('icon_minus');
        if (tttt > -1) {
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
			//var chat_search_1 = window.innerHeight + window.scrollY;             		
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
		var hhtt = $('.chat_box_inner').height() - adjustHeight;
		$('.chat_box_inner').height(hhtt);
				
    });*/
   	$(document).on("click",".document_library",function(){
			$('#test').toggleClass('cheat_height_small');
			$('#test').toggleClass('cheat_height_big');			
	});
	
	// Folder View,List View,Left View,Bottom View
   	$(document).on("click",".user_images",function(){
		
		if($('.uparrowdiv').css('display')=='none')
		{
			$('.uparrowdiv').css('display','block');
			
		}
		else{
			$('.uparrowdiv').css('display','none');
				
		}
		
		  

		});
		
		
		///Appoment Tab Started Here 

   	$(document).on("click",".tab_menu_1",function(){
			if($('.appoment_tab_1').css('display')=='none')
			{
				$('.appoment_tab_2').css('display','none');
				$('.tab_menu_1').addClass('tab_menu_1_bg')
				$('.appoment_tab_1').css('display','block');
				$('.tab_menu_2').removeClass('tab_menu_2_bg');
				
				}		
	});

   	$(document).on("click",".tab_menu_2",function(){
			if($('.appoment_tab_2').css('display')=='none')
			{
				$('.appoment_tab_2').css('display','block');
				$('.appoment_tab_1').css('display','none');
				$('.tab_menu_1').removeClass('tab_menu_1_bg');
				$('.tab_menu_2').addClass('tab_menu_2_bg');
				}		
	});
	
	
	
	
	
	/// Add New User 

   	$(document).on("click",".add_user_js",function(){
		     
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
	   

   	$(document).on("click",".logged_user_js",function(){
		       	
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
   	$(document).on("click",".more_click",function(){
				  if($('.more_option_event').css('display')=='none')
				  {
					  $('.header_menu').css('display','block');
					  $('.more_click').removeClass('active');
					  }
					  else{
						  
						  $('.header_menu').css('display','none');
						  
						  }
				  
				  
				  });
				  
				  

   	$(document).on("click",".remove_menu",function(){
					  
					  if($('.more_option_event').css('display')=='block')
					  {
							$('.full_width').addClass('add_margin');
							$('.main_statical').addClass('add_margin');
							$('.tab_mid').addClass('add_margin');
					  }
					  }
				  );
				  
				  
				  /// Tab Calender 
   	$(document).on("click",".calender_box",function(){
					  
					  $('.calender_div').addClass('calender_images')
					  
					  
					  
					  });
				  

   	$(document).on("click",".remove_menu",function(){
				  
				  	if($('.more_option_event').css('display')=='none')
					 {
						  
						   	$('.main_statical').removeClass('add_margin');
							$('.tab_mid').removeClass('add_margin');
						  }
	                	  }
				  );
	    
	   //User List

   	$(document).on("click",".User_List_js",function(){
		
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

   	$(document).on("click",".group_List_js",function(){

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

   	$(document).on("click",".user_profile_js",function(){
		
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
	

   	$(document).on("click",".mini_type_js",function(){
		
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
	

   	$(document).on("click",".large_name",function(){
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
   	$(document).on("click",".edit_user",function(){
			
				   if($('.new_edit_pages').css('display')=='none'){
							 $('.new_edit_pages').css('display','block');
							 $('.user_profile_content').css('display','none');
							      $('.group_List_content').css('display','none');
					 $('.group_List_js').removeClass('group_user_bg');
					 $('.edit_user').css('display','none');
					 $('.user_profile_content').css('display','none');
				   }});
		          
			/// Delete Pages EDITE PAGE ONLY 

   	$(document).on("click",".delete_new_user",function(){
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

   	$(document).on("click",".delete_user",function(){
					
					confirm('Are You Sure !')
					
					if($('.edite_user_profile').css('display')=='block')
					{
						
						$('.edite_user_profile').css('display','none');
						$('.delete_user_info').css('display','block');
						     $('.group_List_content').css('display','none');
					 $('.group_List_js').removeClass('group_user_bg');

						}});	
						
						/// NEW EDIT PAGES 
   	$(document).on("click",".new_edit",function(){
					
						  if($('.new_edit_pages').css('display')=='none')
						  {
							  $('.new_edit_pages').css('display','block');
					          $('.User_List_content').css('display','none')
							  $('.User_List_js').removeClass('user_list_bg');
							  	 $('.user_profile_content').css('display','none');
							 }
						  });
						  
						  
						  
						  
						  		/// NEW EDIT PAGES  WHEN PROFILE PAGES VISIT
   	$(document).on("click",".edit_user",function(){
					
						  if($('.new_edit_pages').css('display')=='none')
						  {
							  $('.new_edit_pages').css('display','block');
					          $('.User_List_content').css('display','none')
							  $('.User_List_js').removeClass('user_list_bg');
							 }
						  });
						
						
						  /// DELETE USER PROFILE PAGE (ADMIN)

   	$(document).on("click",".delete_user_1",function(){
					
					confirm('Are You Sure !')
					
					if($('.user_profile_content').css('display')=='block')
					{
						
						$('.user_profile_content').css('display','none');
						$('.delete_user_info').css('display','block');
						     $('.group_List_content').css('display','none');
					 $('.group_List_js').removeClass('group_user_bg');

						}});	

				/// CANCEL THE USER PROFILE EDITE (ADMIN)
   	$(document).on("click",".cancel_user_profile",function(){
					   if($('.user_profile_content').css('display')=='none')
					   {
						   
						   
						   
						    $('.edite_user_profile').css('display','none');
							 $('.user_profile_content').css('display','block');
							      $('.group_List_content').css('display','none');
					 $('.group_List_js').removeClass('group_user_bg');
						   }});
						 
				/// PROFILE PAGES TO EDITE PAGES
   	$(document).on("click",".edit_user",function(){
					
					if($('.edit_user').css('display')=='none')
					{
						
						
						}
					
					
					
					});		   
						
						
				/// SHARED FOLDER STARTED HERE 
   	$(document).on("click",".shared_option",function(){
					
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

   	$(document).on("click","ul.tabs li",function(){
		$("ul.tabs li").removeClass("active");
		$(this).addClass("active");
		$(".tab_content_1").hide();
		var activeTab = $(this).attr("rel"); 
		$("#"+activeTab).fadeIn(); 
	});
});

/*@@@@@ 

        ******************************************
        ************************************
               LEFT EVENT END HERE   
	    ************************************
		******************************************
			   
@@@@@@*/

// MID LINE BETWEEN TWO EVENT 

/*@@@@@ 

        ******************************************
        ************************************
               ONLY EVENT STARED  HERE   
	    ************************************
		******************************************
			   
@@@@@@*/




function showHide(event) {
    var ele = document.getElementById("search_form");
    if (ele.style.display == "block") {
        ele.style.display = "none";
		$('.user_information').css('display','none');
		
    }
    else {
        ele.style.display = "block";
		$('.user_information').css('display','none');
    }
	event.stopPropagation();
}
function Hide() {
    var ele = document.getElementById("search_form");
    if (ele.style.display == "block") {
        ele.style.display = "none";
    }
}

function showHidetool() {
    var ele = document.getElementById("search_form_tool");
    if (ele.style.display == "block") {
        ele.style.display = "block";
        ele.style.opacity = "1";
    }
    else {
        ele.style.display = "block";
    }
}

function showHidemenuleft() {
    var ele = document.getElementById("left_margin");
    if (ele.style.display == "block") {
        ele.style.display = "block";
        ele.style.opacity = "1";
    }
    else {
        ele.style.display = "none!important";
    }
}
//----------/// ONLY FOR PAGE FORMAT CHANGE LEFT SIDE--//
function showHidepageleft() {
    var ele = document.getElementById("right_tab");
    if (ele.style.display == "block") {
        ele.style.display = "block";
        ele.style.opacity = "1";
    }
}


function showHidepageright() {
    var ele = document.getElementById("right_tab");
    if (ele.style.display == "block") {
        ele.style.display = "block";
        ele.style.width = "block";
        ele.style.float = "left";
    }
    else {
        ele.style.display = "none";
    }
}

function leftmenutool() {
    var ele = document.getElementById("open");
    if (ele.style.display == "block") {
        ele.style.display = "block";
    }
    else {
        ele.style.display = "block";
    }
}

//$(document).ready(function($){

//$('#accordion-3').dcAccordion({
//eventType: 'click',
//autoClose:false,
//saveState: false,
//disableLink: false,
//showCount: false,
//speed: 'slow'
//});	
//$('.left_margin').css('display','block');
//$('.ac-small').css('height','140px');
//});

jQuery(document).ready(function() {
    // initiate layout and plugins
    // App.init();
    // Charts.init();
    // Charts.initCharts();
    // Charts.initPieCharts();
    $('.row_content').click(fortool);
});

function lunchboxOpen(lunchID) {
    document.getElementById('lunch_' + lunchID).style.display = "block";
    document.getElementById('clasp_' + lunchID).innerHTML = "<a href=\"javascript:lunchboxClose('" + lunchID + "');\">Close Lunchbox " + lunchID + "...</a>";
}
function lunchboxClose(lunchID) {
    document.getElementById('lunch_' + lunchID).style.display = "none";
    document.getElementById('clasp_' + lunchID).innerHTML = "<a href=\"javascript:lunchboxOpen('" + lunchID + "');\">Open Lunchbox " + lunchID + "...</a>";
}

// to show and hide mail view panel
// to show and hide mail view panel
function toggleViewPanel() {
	$('.row_content').addClass('pading_main');
	$('.vsplitbar').removeClass('new_spertator');
	$('.mid_tab').css('top','80');
	$('.top_bottom_1').removeClass('top_margin');
	$('.mail_content').removeClass('new_mail_right_1');
	$('.mail_content').removeClass('mail_con_righ');
	$('.mail_content_1').removeClass('new_mail_light');
	$('.tab_main_div').removeClass('tab_left_con');
	$('.row_first').removeClass('mail_de_op');
	$('.top_tool_information').css('display','block');
	$('.row_left').removeClass('left_view_con')
    $('.mid_tab').attr('style', '');
    $('.mail_content').attr('style', '');
    $('.row_content').removeClass('left_view_mess');
    // reverting back from bottom view        
    //$('.mid_tab').css('height', '85%');
    // reverting back from left view
    $('.mid_tab').css('width', '100%');
    $('.mid_tab').css('float', '');
   // $('.mail_content').css('height', '37%');
    $('.mail_content').css('width', '100%');
    $('.mail_content').css('display', 'none');

    // turn off splitter 
    $('.vsplitbar').remove();
    $('.hsplitbar').remove();
    leftCalled = false;
    bottomCalled = false;
    leftPane = false;
    rightPane = false;
}
// to shift the view panel to left of the mailbox panel
function shiftViewLeft() {
    if (!leftPane) {
        toggleViewPanel();
		$('.mid_tab').removeClass('bottom_tab');
		$('.row_content').removeClass('pading_main');
		$('.vsplitbar').addClass('new_spertator');
		$('.mid_tab').css('top','46');
		$('.top_tool_information').css('display','none');
		$('.top_bottom_1').removeClass('top_margin');
		$('.mail_content').addClass('new_mail_right_1');
		$('.mail_content_1').addClass('new_mail_light');
		$('.tab_main_div').addClass('tab_left_con');
		
		$('.mail_content').removeClass('mail_right_con');
        $('.mid_tab').css('float', 'left');
		$('.row_left').addClass('left_view_con');
		$('.row_content').addClass('left_view_mess');
		$('.row_first').addClass('mail_de_op');
        //$('.mid_tab').css('width', '50%');

       // $('.mail_content').css('height', '85%');
        //$('.mail_content').css('width', '49%');
        $('.mail_content').css('display', 'block');
		$('.mail_content').css('top','46');
        if (!leftCalled) {
            $('#widget').unbind();
            $('#widget').splitter({type: 'v'});
            leftCalled = true;
        } else {
            $('.vsplitbar').css('display', '');
        }
        $('.hsplitbar').remove();
        bottomCalled = false;
        leftPane = true;
    }
}
var leftCalled = false;
var bottomCalled = false;
var leftPane = false;
var rightPane = false;

function shiftViewBottom() {
    if (!rightPane) {
		$('.mid_tab').addClass('bottom_tab');
		$('.row_content').addClass('pading_main');
		$('.vsplitbar').removeClass('new_spertator');
		$('.mid_tab').css('top','80');
		$('.top_tool_information').css('display','block');
		$('.top_bottom_1').addClass('top_margin');
		$('.mail_content').addClass('mail_right_con');
		$('.mail_content').removeClass('new_mail_right_1');
		$('.mail_content').removeClass('mail_con_righ');
		$('.mail_content_1').removeClass('new_mail_light');
		$('.tab_main_div').removeClass('tab_left_con');
		
	    $('.row_first').removeClass('mail_de_op');
		$('.row_left').removeClass('left_view_con')
		$('.row_content').removeClass('left_view_mess');
        toggleViewPanel();
        $('.mid_tab').css('height', '38%');
        $('.mail_content').css('display', 'block');
        //$('.mail_content').css('height', '37%');
		$('.mail_content').css('top','0');
		

        if (!bottomCalled) {
            $('#widget').unbind();
            $('#widget').splitter({type: 'h'});
            bottomCalled = true;
        } else {
            $('.hsplitbar').css('display', '');
        }
        $('.vsplitbar').remove();
        leftCalled = false;
        rightPane = true;
    }
}

function tabfirst() {

    if ($('.tab_first_content').css('display') == "block")
    {
		$('.tab_first_content').animate({
				height: "0px",
			},{
				duration: 500, 
				specialEasing: {
					height: "linear"
				},
				complete: function() {
					$('.tab_first_content').css('display', 'none');
				}
			}
		);
		
    }else {
		$('.tab_first_content').css('display', 'block');
		$('.tab_first_content').animate({
				height: "300px",
			},{
				duration: 500, 
				specialEasing: {
					height: "linear"
				},
				complete: function() {
					
				}
			}
		);
    }
}



function tabfirst1() {

    if ($('.tab_first_content1').css('display') == "block")
    {

        $('.tab_first_content1').animate({
				height: "0px",
			},{
				duration: 500, 
				specialEasing: {
					height: "linear"
				},
				complete: function() {
					$('.tab_first_content1').css('display', 'none');
				}
			}
		);

    }

    else {

        $('.tab_first_content1').css('display', 'block');
		$('.tab_first_content1').animate({
				height: "300px",
			},{
				duration: 500, 
				specialEasing: {
					height: "linear"
				},
				complete: function() {
					
				}
			}
		);


    }



}



function tabfirst2() {

    if ($('.tab_first_content2').css('display') == "block")
    {

        $('.tab_first_content2').animate({
				height: "0px",
			},{
				duration: 500, 
				specialEasing: {
					height: "linear"
				},
				complete: function() {
					$('.tab_first_content2').css('display', 'none');
				}
			}
		);

    }

    else {

        $('.tab_first_content2').css('display', 'block');
		$('.tab_first_content2').animate({
				height: "300px",
			},{
				duration: 500, 
				specialEasing: {
					height: "linear"
				},
				complete: function() {
					
				}
			}
		);


    }



}

function tabfirst3() {

    if ($('.tab_first_content3').css('display') == "block")
    {

        $('.tab_first_content3').animate({
				height: "0px",
			},{
				duration: 500, 
				specialEasing: {
					height: "linear"
				},
				complete: function() {
					$('.tab_first_content3').css('display', 'none');
				}
			}
		);

    }

    else {

        $('.tab_first_content3').css('display', 'block');
		$('.tab_first_content3').animate({
				height: "300px",
			},{
				duration: 500, 
				specialEasing: {
					height: "linear"
				},
				complete: function() {
					
				}
			}
		);


    }



}


function fortool()
{
    $('.search_form_tool').css('display', 'block');
    $('.row_content').removeClass('selected_row');
    $(this).addClass('selected_row');
}
function userinformation(e)
{

    if ($('.user_information').css('display') == 'none') {
		$('.search_form_1').css('display','none');


        $('.user_information').css('display', 'block');
		$('#search_form').css('display','none');

    }else {
         
		 $('.search_form_1').css('display','none');
        $('.user_information').css('display', 'none');

    }
	e.stopPropagation();
	

}


function option_here()
{
    if ($('.mail_down_option').css('display') == "none")
    {
        $('.mail_down_option').css('display', 'block');
    }

    else {

        $('.mail_down_option').css('display', 'none');

    }

}



function option_here_1(event)
{
    if ($('.mail_down_option_1').css('display') == "none")
    {
        $('.mail_down_option_1').css('display', 'block');
    }

    else {

        $('.mail_down_option_1').css('display', 'none');

    }
	event.stopPropagation();

}



function mail_forward()
{

    if ($('.your_option').css('display') == "block")
    {

        $('.your_option').css('display', 'none');
        $('.mail_forward').css('display', 'block');


    }

    else {
        $('.your_option').css('display', 'block');
        $('.mail_forward').css('display', 'none');

    }



}


function mail_forward_1()
{

    if ($('.your_option_1').css('display') == "block")
    {

        $('.your_option_1').css('display', 'none');
        $('.mail_forward_1').css('display', 'block');


    }

    else {
        $('.your_option_1').css('display', 'block');
        $('.mail_forward_1').css('display', 'none');

    }



}


function mail_forward_11()
{

    if ($('.your_option_1').css('display') == "block")
    {

        $('.your_option_1').css('display', 'none');
        $('.mail_forward_11').css('display', 'block');


    }

    else {
        $('.your_option_1').css('display', 'block');
        $('.mail_forward_11').css('display', 'none');

    }



}





function down_mail(event)
{


    if ($('.main_bottom_option').css('display') == "none")
    {

        $('.main_bottom_option').css('display', 'block');



    }


    else {

        $('.main_bottom_option').css('display', 'none');


    }

event.stopPropagation();
}



function bootom_forward() {


    if ($('.for_bottom').css('display') == "none")
    {

        $('.for_bottom').css('display', 'block');

    }

    else {


        $('.for_bottom').css('display', 'none');

    }

event.stopPropagation();
}


function mail_to(event) {


    if ($('.to_me').css('display') == "none")
    {

        $('.to_me').css('display', 'block');

    }

    else {

        $('.to_me').css('display', 'none');

    }

event.stopPropagation();

}

/// MOUSE OVER TOOL TIPS 
var popout=0;
$(document).ready(function(e) {
	
    $('.cheat_row').mouseover(function(){	
	    //$('.chat_info' ).offset({  top:$(this).offset().top - $(this).height(), left: $(this).offset().left + $(this).width()});
		

		//alert(window.scrollTop()+ window.innerHeight());
		var height = $(this).position().top + $('.chat_info').height();
		var innerheight =window.innerHeight + window.scrollY;
		if( height > innerheight)
		{	           
			   $('.chat_info' ).position({ top:$(this).position().top - (height-innerheight), left: $(this).position().left + $(this).width()});
			  		  
		}
		else
		{
			
			//$('.chat_info' ).position({ top:$(this).position().top , left: $(this).position().left + $(this).width()});
			$(".chat_info").css({ top:$(this).position().top   , left: $(this).position().left});
			
		}
		$('.chat_info').show();
	});
	
	$('.chat_info').mouseout(function(){
		popout=0;
	    $('.chat_info').hide();		
	});
	
	$('.chat_info').mouseover(function(){
		popout=1;
		$('.chat_info').show();		
	});
	
	$('.cheat_row').mouseout(function(){
		if(popout==0)
		{
			$('.chat_info').css('display','none');
		}
	});
	
	// SECOND CHAT STARED HERE (CHAT SEARCH )
	var adjustChatHeight;
	var popout_search = 0;
	$('.cheat_row_11').mouseover(function(){	
		var height = $(this).offset().top + $('.chat_info_1').height();
		var innerheight =window.innerHeight + window.scrollY;
		if( height > innerheight)
		{	           
			  $('.chat_info_1' ).position({ top:$(this).position().top - (height-innerheight)-40, left: $(this).position().left + $(this).width()});
			  		  
		}
		else
		{
			
			//$('.chat_info' ).position({ top:$(this).position().top , left: $(this).position().left + $(this).width()});
			$(".chat_info_1").css({ top:$(this).position().top-40, left: $(this).position().left + $(this).width()});
			
		}
		/*
		if ($('.tab_header').find('.icon').attr('class').indexOf('icon_minus') > -1){
			var chat_search_top = $('.chat_inner_content').offset().top + $('.chat_inner_content').height();
			var chat_search_1 = window.innerHeight + window.scrollY; 
			adjustChatHeight = chat_search_top - chat_search_1;
		}
		
	    //$('.chat_info' ).offset({  top:$(this).offset().top - $(this).height(), left: $(this).offset().left + $(this).width()});
		//alert(window.scrollTop()+ window.innerHeight());
		var height = $(this).position().top + $('.chat_info_1').height();
		var innerheight =window.innerHeight + window.scrollY;
		if( height > innerheight)
		{	           
			   $('.chat_info_1' ).css({ top:$(this).position().top - ((height-innerheight)), left: $(this).position().left 
			   + $(this).width()});			  
		}
		else
		{
			//$('.chat_info' ).position({ top:$(this).position().top , left: $(this).position().left + $(this).width()});
			$(".chat_info_1").css({ top:$(this).position().top  , left: $(this).position().left + $(this).width()});
		}*/
		/*
		//TODO: fix hard coded 20 value
		var overflowVal = (($(this).offset().top - 18) + $('.chat_info_1').height()) - window.innerHeight;
		if(overflowVal > 0)
		{
			$(".chat_info_1").css({ top: ($(this).position().top - 18 - overflowVal)   , left: $(this).position().left + $(this).width()});
		}
		else
		{
			$(".chat_info_1").css({ top:$(this).position().top - 18   , left: $(this).position().left + $(this).width()});
		}*/
		//$(".chat_info_1").css({ top:0   , left: $(this).position().left + $(this).width()});
		$('.chat_info_1').show();
	});
	
	
	$('.chat_info_1').mouseout(function(){
		popout_search=0;
	    $('.chat_info_1').hide();		
	});
	
	$('.chat_info').mouseover(function(){
		popout_search=1;
		$('.chat_info').show();		
	});
	
	$('.cheat_row_11').mouseout(function(){
		if(popout_search==0)
		{
			$('.chat_info_1').css('display','none');
		}
	});



   // SECOND CHAT STARED HERE 	
	
	
	
	
    // CHAT OPTIONS(chat_h_right) STARED HERE
	var adjust_height;
	$('.chat_h_right').click(function(){
		
	    var chat_search_top = $(this).offset().top +  $('.chat_search').height();
		var chat_search_1 = window.innerHeight + window.scrollY;   
		if($('.chat_search').css('display')=='none')
		{
			$('.chat_search_11').css('display','none');
			if( chat_search_top > chat_search_1)
			{ 
				adjust_height =(chat_search_top - chat_search_1 ) ;
				//$('.chat_search').css({bottom:adjust_height});	
				//$('.all_chat_option').css({bottom:adjust_height});				
            }
			else 
			{
				adjust_height == 0;
			}
			$('.chat_search').css('display','block');
			$('.all_chat_option').addClass('downarrow_chat')
			//$('.chat_search').offset( { top:($(this).offset().top-adjust_height),left:$(this).offset().left + $(this).width() } );
			//$('.chat_search').offset( { top:0, left:0);
		}
		else
		{
			$('.all_chat_option').removeClass('downarrow_chat')
			$('.chat_search').css('display','none');
		}

	});
	
	// CHAT OPTION END
	
	
	
			/// Chat Downarrow Only Option Here 
	$('.h_drop').click(function(){
		 var adjust_height = 0;
		 var chat_search_top = $(this).offset().top +  $('.chat_search').height();
		 var chat_search_1 = window.innerHeight + window.scrollY;
             
		
		if($('.chat_search_11').css('display')=='none')
		{
			//var chat_info = $('.chat_info').offset().bottom;
			$('.chat_search').css('display','none');
		    $('.all_chat_option').addClass('downarrow_chat')
		
			if( chat_search_top > chat_search_1)
			{
				 //var adjust_height =($(this).offset().top - (chat_search_top - chat_search_1 )) ;
				//$('.chat_search').offset({ top: adjust_height});
				 adjust_height = chat_search_top - chat_search_1;
				 $('.all_chat_option').css( { bottom:adjust_height + 10,left:$('.chat_h_right').offset().left +32} );
				 // $('.all_chat_option').css( { bottom:adjust_height + 10,left:$('.chat_h_right').offset().left + $('.chat_h_right').width() } );
			}			 
			$('.chat_search_11').css('display','block');		
		}
		else
		{
			$('.all_chat_option').removeClass('downarrow_chat')
			$('.chat_search_11').css('display','none');
		}

	});
		
		
		
		/// CHAT DOWN ARROW EVENT

//// Part 1
$('.chat_down_main ul li').click(function(){
	
	if($('.chat_down_submenu').css('display')=='none'){
		
		    $('.chat_down_submenu').css('display','block');
			$('.chat_downarrow').css('display','none')
		
		}
	
	}
);		

/// Part 2
$('.chat_main_menu').click(function(){
	
	if($('.chat_downarrow').css('display')=='none'){
		$('.chat_downarrow').css('display','block');
		$('.chat_down_submenu').css('display','none');
		
		
		}
	
	
	});
	
	/// Chat Menu Stared Here 
	$('.chat_status_menu').click(function(){
       
	   if($('.chat_status').css('display')=='none'){
		   
		   $('.chat_status').css('display','block');
		   $('.Blocked_status').css('display','none');
		   $('.Invites_status').css('display','none');
		   $('.Share_status').css('display','none');
		   
		   }
	   
	   
	});
		
			/// Invites Stared Here 
	$('.invites_menu').click(function(){
	
	   if($('.Blocked_status').css('display')=='none'){
		   
		   $('.chat_status').css('display','none');
		   $('.Blocked_status').css('display','block');
		   $('.Invites_status').css('display','none');
		   $('.Share_status').css('display','none');
		   
		   }
	});
	
				/// Invites Stared Here 
	$('.blocked_menu').click(function(){
	
	   if($('.Invites_status').css('display')=='none'){
		   
		   $('.chat_status').css('display','none');
		   $('.Blocked_status').css('display','none');
		   $('.Invites_status').css('display','block');
		   $('.Share_status').css('display','none');
		   
		   }

	});
	
					/// Invites Stared Here 
	$('.share_your_menu').click(function(){
	
  if($('.Share_status').css('display')=='none'){
		   
		   $('.chat_status').css('display','none');
		   $('.Blocked_status').css('display','none');
		   $('.Invites_status').css('display','none');
		   $('.Share_status').css('display','block');
		   
		   }
	});
	
	// CHAT SIGH OUT BOX 
	$('.chat_out').click(function(){
		if($('.chat_inner_content').css('display')=='block')
		{
			
			$('.chat_sign_box').css('display','block');
			$('.chat_bottom_main').css('display','none');
			$('.chat_heading_main').css('display','none');
			$('.all_chat_option').css('display','none');
			
			
			
			}
		
		});
		
		
			// CHAT SIGN IN BOX 
	$('.chat_sign_1_box').click(function(){
		
		if($('.chat_bottom_main').css('display')=='none'){
			
          $('.chat_sign_box').css('display','none');
		  $('.chat_bottom_main').css('display','block');
		  $('.chat_heading_main').css('display','block');
		  $('.all_chat_option').css('display','block');
		  $('.chat_search_11').css('display','none')
			
			
			
			}
			

		
		});
		
		// BODY ONCLICK 
		$('body').click(function(e){
			 
			 
			})
		
	});





/*@@@@@ 

        ******************************************
        ************************************
               ONLY EVENT END HERE   
	    ************************************
		******************************************
			   
@@@@@@*/





 

