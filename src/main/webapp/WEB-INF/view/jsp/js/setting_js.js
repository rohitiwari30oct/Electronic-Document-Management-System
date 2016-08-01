// JavaScript Document

jQuery(document).ready(function() {
	
	
	/// CREATE FILTER 
	$('.new_create_filter').click(function(){
		
		//alert('Hi');
		$('.filter_serach').show();
		$('.web_dialog_overlay').show();

		
		
		
		});
		
   // CREATE FILTER END 
   
   
   /// IMPORT FILETR
   
   // IMPORTA FILTER END 
   
   /// GREATER STRED HERE 
   $('.filter_greater').click(function(){
	     
		 $('.filter_greate_all').show();
	   
	   });
   
   /// GREATERR END HERE 
   
   
   // GREATER SELECT 
   
  $('.greater_list').click(function(){
	  
	  $('.greater_than').show();
	  $('.less_than').hide();
	  $('.filter_greate_all').hide();
	  
	  });
	  
	  
	    $('.less_list').click(function(){
			
			$('.greater_than').hide();
	        $('.less_than').show();
			$('.filter_greate_all').hide();
	  
	  });
   
   
   /// GRAETER END 
   
   
   // MB STARED HERE 
   
      $('.filter_mb_kb').click(function(){
		  
		  $('.mb_kb_list').show()
		  
		  });
   
      $('.mb_list').click(function(){
		  
		  $('.mb').show();
		  $('.kb').hide();
		  $('.byte').hide();
		  $('.mb_kb_list').hide();
	   
	   
	   });
	   
	   
	   
	   $('.kb_list').click(function(){
	   
	       $('.mb').hide();
		   $('.kb').show();
		   $('.byte').hide();
		    $('.mb_kb_list').hide();
	   
	   });
	   
	   
	    $('.bytes_list').click(function(){
			
			$('.mb').hide();
		    $('.kb').hide();
		    $('.byte').show();
			 $('.mb_kb_list').hide();
	   
	   
	   });
   
   /// MB END HERE 
   
   
   /// FILTER NEXT PAGE 
   $('.filter_new_event').click(function(){
	   
	   //  alert('Hi')
		 $('.filter_next_page').show();
		 $('.filter_serach').hide();
	     $('.web_dialog_overlay').show();
	   });
   // FILTER NEXT PAGES 
   
   //  SELECT LABLE 
   

   
   $('.select_lable >ul >li').click(function(){
	   
	     var find_lable = $(this).html();
		// alert(find_lable);
		 document.getElementById('lable_option').innerHTML = find_lable;
		// $(this).parent().parent().hide();
		// $('.select_lable').addClass('hide_lable');
		  //$('.select_lable').hide();
		  // $('.category_option').hide();
		  // alert('Hi');
				 $('.select_lable').hide();
			      $('.category_option').hide();

	
	   
	   });
	   
	   $('.lable_option').click(function(){
	   

				 $('.select_lable').show();
				 $('.category_option').hide();

		  
	  // $('.select_lable').removeClass('hide_lable');
	   
	   });
   
   /// SELECT LABLE  END 
		
		
		/// SELECT CATEGORY 
		
		$('.category_option >ul >li').click(function(){
			
			var find_category = $(this).html();
			 document.getElementById('select_category').innerHTML = find_category;
			//alert(find_category);
			$('.category_option').hide();
			$('.select_lable').hide();
			
			
			});
			
			
			$('.select_category').click(function(){
				
				
			//	alert('Hi');
				$('.category_option').show();
				$('.select_lable').hide();
				
				});
		
		// SELECT CATEGOERY END 
		
		$('.filter_buttom_create').click(function(){
			
			var filter_sub = $('.filter_subject').val();
			//alert(filter_sub);
			$('table.filter_data >tbody').append('<tr class="r7"><td class="qV r5"><span>Matches:</span><div class="filter_subject_new"></div></td><td class="qV r5"><span class="qW">Action:</span><div class="filter_subject_mid"> </div></td><td class="qS r5 edite_and_detele"><span class="sA filter_edite" >edit</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="sA filter_delete">delete</span></td></tr>')
			$('.filter_next_page').hide();
			$('.web_dialog_overlay').hide();
			});




/// DELETE THE FILETER
	$(document.body).on('click', '.filter_delete' ,function(){
       
	  // alert('Hi');
	   $(this).parent().parent().remove();

	});

/// DELETE THE FILTER END
		
		
		/// CANCEL 
		
		$('.filter_buttom').click(function(){
			
			    $('.filter_serach').hide();
				$('.web_dialog_overlay').hide();
				$('.filter_next_page').hide();
			
			});
		
		// CANCEL END 
	
	
	
	  /// EDITE 

	$(document.body).on('click', '.filter_edite' ,function(){
		
		
		
				$('.filter_serach').show();
				$('.web_dialog_overlay').show();
		
		
		
		
		
	});
	  
	  // EDITE END HERE 
	  
	  $('.filter_back').click(function(){
		  
		     // alert('Hi')
		  
		       $('.filter_serach').show();
			   $('.filter_next_page').hide();
			   $('.web_dialog_overlay').show();
		  
		  
		  });
	  ///  END HERE 
	
	
	
});