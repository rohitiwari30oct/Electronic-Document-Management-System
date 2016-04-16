jQuery(document).ready(function() {
	
	
		/// MANGE SHARING 
	$(document).on("click",".mange_sharing",function(){
		jQuery.get("sharingPopup", 
				function( data ) {
				if(data=="true"){
					location.href="ajaxTrue";
				}else{
		         $( ".sharing_mange" ).html( data );
		        }
				});
		
		
		
		
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
	$(document).on("click",".mange_can_top",function(){
				   
				             $('.sharing_mange').hide();
							 $('.web_dialog_overlay').hide();
				   
			  });
			  
			   /// MANAGES CANCEL 
	$(document).on("click",".mange_can",function(){
				   
				             $('.sharing_mange').hide();
							 $('.web_dialog_overlay').hide();
				   
			  });
			/*  // ADD MORE SHRE 
			  $(document.body).on('click', '.share_more' ,function(){
				  //alert('hi');
				  $('.sharing_mange >.table_append >table.append_tr >tbody').append('<tr><td><input type="text"    class="initive_people userforshare  ui-autocomplete-input"  autocomplete="off" /></td><td><div class="can_edit"><div  style="float: left;">    <select  style="width: 100px;height: 28px;" class="permissionsforshare"><option value="ur">Can View </option><option value="uw">Can Edit </option><option value="us">Can Manage </option></select></div><div class="delete_shre"><img src="images/delete.png"></div></div></td></tr>');
				  $( ".userforshare" ).autocomplete({
					  source: availableTags
					  });
			  
			  });*/
			   
			   $(document.body).on('click', '.share_more' ,function(){
					 //alert('hi');
					 var share_text = $('.initive_people').val();
					 var select_val = $(this).parent().children().children().val();
					// alert(select_val);
					//  alert(share_text);
					  var select_get =  $(this).parent().children().html();
					 
					 function ValidateEmail(email) {
							var expr = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
							return expr.test(email);
						};
					  
					 
					 // var r = new RegExp("[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
					  if($('.initive_people').val()=='')
					  {
					      // alert('Please Fill The Value !');
					  }
					  else {
						  
					//  $('.sharing_mange >.table_append >table.append_tr >tbody').append('<tr><td><input type="text"  class="initive_people" /></td><td><div class="can_edit"><div class="share_more">Add More</div><div class="can_edite">    <select><option>Can View </option><option>Can Edit </option><option>Can Mange </option></select></div></div></td></tr>');   
							  if (!ValidateEmail($(".initive_people").val())) {
									// alert("Invalid email address.");
								 }
								 else {
									//  alert("Valid email address.");
									// alert(share_text);
									// alert(select_get);
									 $("#addOption").val("ur")
			                		   .find("option[value=" + "ur" +"]").attr('selected', true);
									 select_get=select_get.replace("addOption","");
									  $('.invite_people_box').append('<div class="select_append"><div class="share_content"><input class="userforshare userforshhare"  type="text" readonly="readonly" value="'+ share_text +'" /></div> <div class="can_edite"> '+ select_get +'</div><div class="remove_select delete_shre"> <img id="delete'+share_text+'" src="images/delete.png" /></div><div class="clear"></div></div><div class="clear"></div></div>');
								      $(".initive_people").val('');
								 }
						  }
					 });
		
		/// IMPORT FILE STRED HERE 

				$(document).on("click",".import_click",function(){
			
			         if($('.import_con').css('display')=='none')
					 {
						  $('.import_con').show();
						  $('.web_dialog_overlay').show();
						  $('.con_more').hide();
						  $('div.more_active').removeClass('more_active');
					  }
			
			});

				$(document).on("click",".import_can_top",function(){
		                  $('.import_con').hide();
						  $('.web_dialog_overlay').hide();
		  
		  });

				$(document).on("click",".cancel_import",function(){
		                  $('.import_con').hide();
						  $('.web_dialog_overlay').hide();
		  
		  });
		  
		  /// IMPORT FILE END HERE 
		  
		  	/// Export FILE STRED HERE 

				$(document).on("click",".export_click",function(){
			
			         if($('.export_con').css('display')=='none')
					 {
						  $('.export_con').show();
						  $('.web_dialog_overlay').show();
						  $('.con_more').hide();
						  $('div.more_active').removeClass('more_active');
					  }
			
	  });

				$(document).on("click",".export_can_top",function(){
		                  $('.export_con').hide();sc
						  $('.web_dialog_overlay').hide();
		  
		  });

				$(document).on("click",".cancel_export",function(){
		                  $('.export_con').hide();
						  $('.web_dialog_overlay').hide();
		  
    });
		
		
		/// DELETE SHARE FILE 
		
		$(document.body).on('click','.delete_shre',function(){
			
			//alert('Hi')
			var find_del = $(this).length;
		//	alert(find_del);
			$(this).parent().remove();
			
			});
		
		
		/// DELETE SHRE FILE 
	
	
	
	
	
	
	});