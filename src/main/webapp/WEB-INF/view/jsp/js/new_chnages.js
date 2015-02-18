// JavaScript Document


$(document).ready(function() {
	$(document).on("click",".serach_top >span",function(){
					//alert('Hi')
					  if($('.search_box_details').css('display')=='none')
					       {
						
						        $('.search_box_details').css('display','block');
						
						   }
					     else
					      {
						
						      $('.search_box_details').css('display','none');
						 
						  }
						
						
				    });
	
	/// ACTIVE LEFT PART STRED HERE 

	$(document).on("click",".left_bottom_part >ul >li",function(){
		
		//alert('Hi');
		$('li.active_left').removeClass('active_left')
		$(this).addClass('active_left')
		});
		
   /// ACTIVE LEFT MENU		
		
		
	/// FOR FOLDER VIEW ONLY 
	$(document).on("click",".folder_only >ul >li",function(){
		
		//alert('THIS IS FOLDER VIEW ')
		
		if($('.new_option_folder').css('display')=='none')
		{
			$('.new_option_folder').show();
			$('.new_option_file').hide();
			
			}
		
		
		});
	
	/// FOR FOLDER VIEW END HERE 
		/// FOR File VIEW ONLY 

	$(document).on("click",".file_only >ul >li",function(){
		
		//alert('This Is File View ');
		if($('.new_option_file').css('display')=='none')
		{
			$('.new_option_file').show();
			$('.new_option_folder').hide();
			
			}
		
		
		});
	
	/// FOR File VIEW END HERE 
	
	/// NEW MORE OPTION STRED HERE 

	$(document).on("click",".new_more_icon_folder",function(){
			
			//  alert('Hi');
			 var more_top =  $(this).offset().top;
			 var more_left =  $(this).offset().left;
			// alert(more_top);
			// alert(more_left);
			 $('.new_more_folder').css('top',more_top-37);
			 $('.new_more_folder').css('left',more_left-235);
			 
			 if($('.new_more_folder').css('display')=='none')
			 {
				 $('.new_more_folder').show();
				 
				 }else {
					 $('.new_more_folder').hide();
					 
					 }
			
			
			});
	
	
	/// NEW MORE OPTION END HERE 
	
	
	
		/// NEW MORE OPTION STRED HERE 
		$(document).on("click",".new_more_icon_file",function(){
			
			//   alert('Hi');
			 var more_top =  $(this).offset().top;
			 var more_left =  $(this).offset().left;
			// alert(more_top);
			// alert(more_left);
			 $('.new_more_file').css('top',more_top-37);
			 $('.new_more_file').css('left',more_left-235);
			 
			 if($('.new_more_file').css('display')=='none')
			 {
				 $('.new_more_file').show();
				 
				 }else {
					 $('.new_more_file').hide();
					 
					 }
			
			
			});
	
	
	/// NEW MORE OPTION END HERE 
	
	
	
	
	
	
	
	
	
	
	
	
	
	/// THUM VIEW STRED HERE 
		$(document).on("click",".thum_view",function(){
		
		//  alert('Thum View ');
		  $('.list_view').show();
		  $('.thum_view').hide();
		
		})
	
	/// THUM VIEW END HERE 
	
	/// LIST VIEW STRED HERE 
		$(document).on("click",".list_view",function(){
		
		
		//alert('LIST VIEW ');
		 $('.list_view').hide();
		  $('.thum_view').show();
		
		})
	
	/// LIST VIEW END HERE 
	
	
	/// SEARCH ON FOCUS STARTED

       $('.serach_top >input').on('focus',function(){
				   
				   
				   //alert('Hi');
				   if($('.search_box_details').css('display')=='block')
				   {
					    $('.search_box_details').css('display','none');
					   
					   }
				   
				   });
	
   /// SEARCH END HERE	
	
	
	
	});






