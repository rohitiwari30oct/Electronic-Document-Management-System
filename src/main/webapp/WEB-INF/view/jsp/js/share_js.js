jQuery(document).ready(function() {
	
	
		/// MANGE SHARING 
	$(document).on("click",".mange_sharing",function(){
					
					    // alert('Hi');
						 $('.con_more').hide();
						 $('.calender_option').hide();
						 $('div.more_active').removeClass('more_active');
						 if($('.sharing_mange').css('display')=='none')
						 {
							 $('.sharing_mange').show();
							 $('.web_dialog_overlay').show();
							 
					     }
					
					});	
			
			   /// MANAGES CANCEL TOP 
			   $('.mange_can_top').click(function(){
				   
				             $('.sharing_mange').hide();
							 $('.web_dialog_overlay').hide();
				   
			  });
			  
			   /// MANAGES CANCEL 
			   $('.mange_can').click(function(){
				   
				             $('.sharing_mange').hide();
							 $('.web_dialog_overlay').hide();
				   
			  });
			  // ADD MORE SHRE 
			  $(document.body).on('click', '.share_more' ,function(){
				  //alert('hi');
				  $('.sharing_mange >.table_append >table.append_tr >tbody').append('<tr><td><input type="text"  class="initive_people" /></td><td><div class="can_edit"><div  style="float: left;">    <select  style="width: 100px;height: 28px;"><option>Can View </option><option>Can Edit </option><option>Can Manage </option></select></div><div class="delete_shre"><img src="images/delete.png"></div></div></td></tr>');
				  });
		
		/// IMPORT FILE STRED HERE 
		
		$('.import_click').click(function(){
			
			         if($('.import_con').css('display')=='none')
					 {
						  $('.import_con').show();
						  $('.web_dialog_overlay').show();
						  $('.con_more').hide();
						  $('div.more_active').removeClass('more_active');
					  }
			
			});
	
	  $('.import_can_top').click(function(){
		                  $('.import_con').hide();
						  $('.web_dialog_overlay').hide();
		  
		  });
		  
		   $('.cancel_import').click(function(){
		                  $('.import_con').hide();
						  $('.web_dialog_overlay').hide();
		  
		  });
		  
		  /// IMPORT FILE END HERE 
		  
		  	/// Export FILE STRED HERE 
		
		$('.export_click').click(function(){
			
			         if($('.export_con').css('display')=='none')
					 {
						  $('.export_con').show();
						  $('.web_dialog_overlay').show();
						  $('.con_more').hide();
						  $('div.more_active').removeClass('more_active');
					  }
			
	  });
	
	  $('.export_can_top').click(function(){
		                  $('.export_con').hide();
						  $('.web_dialog_overlay').hide();
		  
		  });
		  
     $('.cancel_export').click(function(){
		                  $('.export_con').hide();
						  $('.web_dialog_overlay').hide();
		  
    });
		
		
		/// DELETE SHARE FILE 
		
		$(document.body).on('click','.delete_shre',function(){
			
			//alert('Hi')
			var find_del = $(this).length;
		//	alert(find_del);
			$(this).parent().parent().parent().remove();
			
			});
		
		
		/// DELETE SHRE FILE 
	
	
	
	
	
	
	});