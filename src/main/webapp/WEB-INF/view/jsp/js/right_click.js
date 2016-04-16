// JavaScript Document

$(document).ready(function() {
	
	
	
	///  FOLDER RIGHT CLICK STRED HERE *************************
	
   $(document).on("contextmenu", ".folderContextMenuClass", function(e){
            // alert('Context Menu event has fired!');
			 var right_menu_top = $(this).offset().top;
			 var right_menu_left = $(this).offset().left;
			// alert(right_menu_top);
			// alert(right_menu_left);
			 $('li.new_select_box').removeClass('new_select_box');
			 $('ul.new_select_box').removeClass('new_select_box');
			 $(this).addClass('new_select_box');
			 $('.right_click_menu').css('top',right_menu_top -40);
			 $('.right_click_menu').css('left',right_menu_left -120);
             $('.right_click_menu').show();
			 $('.right_click_menu_file').hide();
	         $('.right_click_menu_blank').hide();
		
			 

			 /// FOR FOLDER
			 
			 var height = $(this).offset().top + $('.right_click_menu').height();
			 var innerheight =window.innerHeight + window.scrollY;
			// alert(height+","+innerheight);
			 if( height > innerheight){
				//alert("$(this).offset().top "+$(this).offset().top);
				//alert("(height-innerheight+20) "+(height-innerheight+20));
				//alert($(this).offset().top - (height-innerheight+20));
			   $('.right_click_menu' ).offset({ top:$(this).offset().top - (height-innerheight+20)});
			 }
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
	
   $(document).on("contextmenu", ".fileContextMenuClass", function(e){
            // alert('Context Menu event has fired!');
			 var right_menu_top = $(this).offset().top;
			 var right_menu_left = $(this).offset().left;
			// alert(right_menu_top);
			// alert(right_menu_left);
			 $('li.new_select_box').removeClass('new_select_box');
			 $('ul.new_select_box').removeClass('new_select_box');
			 $(this).addClass('new_select_box');
			 $('.right_click_menu_file').css('top',right_menu_top -40);
			 $('.right_click_menu_file').css('left',right_menu_left -120);
             $('.right_click_menu_file').show();
			 $('.right_click_menu').hide();
	         $('.right_click_menu_blank').hide();
	
				/// FOR FILE ONLY

			// alert(height+","+innerheight);
			 var height = $(this).offset().top + $('.right_click_menu_file').height();
			 var innerheight =window.innerHeight + window.scrollY;
			// alert(height+","+innerheight);
			 if( height > innerheight){

					//alert($(this).offset().top - (height-innerheight+20));
			   $('.right_click_menu_file' ).offset({ top:$(this).offset().top - (height-innerheight+20)});
			  
			 }

             return false;
              });
	
	
  $('html').click(function() {
           $('.right_click_menu').hide();
		   $('.right_click_menu_file').hide();
		   $('.search_box_details').hide();
	         $('.right_click_menu_blank').hide();
           return true;
           });

  $('.right_click_menu').click(function(event){
            event.stopPropagation();
           });

  $('.right_click_menu_blank').click(function(event){
	 
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
	

  

  
  
  
  
  
  
	
  $(document).on("contextmenu", ".rightClickClassForFolder", function(e){
          //  alert('Context Menu event has fired!');
			 var right_menu_top = $(this).offset().top;
			 var right_menu_left = $(this).offset().left;
			// alert(right_menu_top);
			// alert(right_menu_left);
			 $('div.new_select_box_shared').removeClass('new_select_box_shared');
			 $(this).addClass('new_select_box_shared');
			 $('.right_click_menu').css('top',right_menu_top -40);
			 $('.right_click_menu').css('left',right_menu_left -120);
            $('.right_click_menu').show();
			 $('.right_click_menu_file').hide();

	         $('.right_click_menu_blank').hide();
			 

			 /// FOR FOLDER

			 //alert(height+","+innerheight);
			 var height = $(this).offset().top + $('.right_click_menu').height();
			 var innerheight =window.innerHeight + window.scrollY;
			 if( height > innerheight){
			   $('.right_click_menu' ).offset({ top:$(this).offset().top - (height-innerheight+20)});
			  
			 }
		
            return false;
             });
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  $(document).on("contextmenu", ".rightClickClassForFile", function(e){
      // alert('Context Menu event has fired!');
		 var right_menu_top = $(this).offset().top;
		 var right_menu_left = $(this).offset().left;
		// alert(right_menu_top);
		// alert(right_menu_left);
		 $('div.new_select_box_shared').removeClass('new_select_box_shared');
		 $(this).addClass('new_select_box_shared');
		 $('.right_click_menu_file').css('top',right_menu_top -40);
		 $('.right_click_menu_file').css('left',right_menu_left -120);
       $('.right_click_menu_file').show();
		 $('.right_click_menu').hide();

         $('.right_click_menu_blank').hide();
		/// FOR FILE ONLY


		 var height = $(this).offset().top + $('.right_click_menu_file').height();
		 var innerheight =window.innerHeight + window.scrollY;
		
		 
		 if( height > innerheight){
		           
		   $('.right_click_menu_file' ).offset({ top:$(this).offset().top - (height-innerheight+20)});
		  
		 }


       return false;
        });
  
  
  
  
  $(document).on("click", ".rightClickClassForFile", function(e){
     
		 $('div.new_select_box_shared').removeClass('new_select_box_shared');
		 $(this).addClass('new_select_box_shared');
  });
  
  
  $(document).on("click", ".rightClickClassForFolder", function(e){
     
		 $('div.new_select_box_shared').removeClass('new_select_box_shared');
		 $(this).addClass('new_select_box_shared');
  });
  
  

  $(document).on("contextmenu", ".thum_view_middle1", function(e){
           //  alert('Context Menu event has fired!');
  
   var offset_t = $(this).offset().top - $(window).scrollTop();
    var offset_l = $(this).offset().left - $(window).scrollLeft();

    window.left = Math.round( (e.clientX - offset_l) );
    window.top_poisition = Math.round( (e.clientY - offset_t) );

// var right_menu_top = $(this).offset().top;
//var right_menu_left = $(this).offset().left;
// alert(right_menu_top);
// alert(right_menu_left);
// $('li.new_select_box').removeClass('new_select_box');
// $(this).addClass('new_select_box');
$('.right_click_menu_blank').css('top',top_poisition);
$('.right_click_menu_blank').css('left',left);
             $('.right_click_menu_blank').show();
             $('.right_click_menu').hide();
             $('.right_click_menu_file').hide();
 

/// FOR FOLDER

var height = $(this).offset().top + $('.right_click_menu_blank').height();
var innerheight =window.innerHeight + window.scrollY;
if( height > innerheight){
	
  $('.right_click_menu_blank' ).offset({ top:$(this).offset().top - (height-innerheight+20)});
}
             return false;
              });
              
	
	});