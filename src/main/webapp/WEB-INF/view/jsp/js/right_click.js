// JavaScript Document

$(document).ready(function() {
	
	
	
	///  FOLDER RIGHT CLICK STRED HERE *************************
	
   $(document).on("contextmenu", ".folder_only >ul >li", function(e){
            // alert('Context Menu event has fired!');
			 var right_menu_top = $(this).offset().top;
			 var right_menu_left = $(this).offset().left;
			// alert(right_menu_top);
			// alert(right_menu_left);
			 $('li.new_select_box').removeClass('new_select_box');
			 $(this).addClass('new_select_box');
			 $('.right_click_menu').css('top',right_menu_top -40);
			 $('.right_click_menu').css('left',right_menu_left -120);
             $('.right_click_menu').show();
			 $('.right_click_menu_file').hide();

			 
			
		
             return false;
              });
	
	
  $('html').click(function() {
           $('.right_click_menu').hide();
		   $('.search_box_details').hide();
           return true;
           });

  $('.right_click_menu').click(function(event){
            event.stopPropagation();
           });
		   // SERACH HIDE --->
  $('.search_box_details').click(function(event){
            event.stopPropagation();
           });
		   // SEARCH END HERE --->
	
	/// FOLDER RIGHT CLICK END HERE **************************
	
	
	
	///  FILE RIGHT CLICK STRED HERE *************************
	
   $(document).on("contextmenu", ".file_only >ul >li", function(e){
            // alert('Context Menu event has fired!');
			 var right_menu_top = $(this).offset().top;
			 var right_menu_left = $(this).offset().left;
			// alert(right_menu_top);
			// alert(right_menu_left);
			 $('li.new_select_box').removeClass('new_select_box');
			 $(this).addClass('new_select_box');
			 $('.right_click_menu_file').css('top',right_menu_top -40);
			 $('.right_click_menu_file').css('left',right_menu_left -120);
             $('.right_click_menu_file').show();
			 $('.right_click_menu').hide();
	
		
             return false;
              });
	
	
  $('html').click(function() {
           $('.right_click_menu').hide();
		   $('.right_click_menu_file').hide();
		   $('.search_box_details').hide();
           return true;
           });

  $('.right_click_menu').click(function(event){
            event.stopPropagation();
           });
		   
		   // FILE HIDDEN 
		   
  $('.right_click_menu_file').click(function(event){
            event.stopPropagation();
           });
		   
		   // FILE HIDDEN 
		   
		   // SERACH HIDE 
  $('.search_box_details').click(function(event){
            event.stopPropagation();
           });
		   // SEARCH END HERE 
	
	/// FILE RIGHT CLICK END HERE **************************
	
	
	
	
	});