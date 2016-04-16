// JavaScript Document


$(document).ready(function() {

	$(document).on("click",".thum_view_middle",function(event){
		//alert("dd");
	    $('.select_box').removeClass('new_select_box');
	           });
	
	$(document).on("click",".serach_top >span",function(){
					//alert('Hi')
					  if($('.search_box_details').css('display')=='none')
					       {
						
						  $('.search_box_details').css('display','block');
						  $('#tab1').css('display','block');
					        
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
	/*$(document).on("click",".folderContextMenuClass",function(){
		
		
		if($('.new_option_folder').css('display')=='none')
		{
			$('.new_option_folder').show();
			$('.new_option_file').hide();
			
			}
		
		
		});*/
	
	/// FOR FOLDER VIEW END HERE 
		/// FOR File VIEW ONLY 

		/*$(document).on("click",".fileContextMenuClass",function(){
		
		if($('.new_option_file').css('display')=='none')
		{
			$('.new_option_file').show();
			$('.new_option_folder').hide();
			
			}
		
		
		});*/
	
	/// FOR File VIEW END HERE 
	
	/// NEW MORE OPTION STRED HERE 

	/*$(document).on("click",".new_more_icon_folder",function(){
			
			 var more_top =  $(this).offset().top;
			 var more_left =  $(this).offset().left;
			 $('.new_more_folder').css('top',more_top-37);
			 $('.new_more_folder').css('left',more_left-235);
			 
			 if($('.new_more_folder').css('display')=='none')
			 {
				 $('.new_more_folder').show();
				 
				 }else {
					 $('.new_more_folder').hide();
					 
					 }
			
			
			});*/
	
	
	/// NEW MORE OPTION END HERE 
	
	
	
		/// NEW MORE OPTION STRED HERE 
	/*	$(document).on("click",".new_more_icon_file",function(event){
			event.stopPropagation();
			 var more_top =  $(this).offset().top;
			 var more_left =  $(this).offset().left;
			 $('.new_more_file').css('top',more_top-37);
			 $('.new_more_file').css('left',more_left-235);
			 
			 if($('.new_more_file').css('display')=='none')
			 {event.stopPropagation();
				 $('.new_more_file').show();
				 
				 }else {
					 $('.new_more_file').hide();
					 
					 }
			
			
			});
	*/
	
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
			 var list_view_height = $(window).height();
			// alert(list_view_height);
			 $('.list_view_content').css('height',list_view_height-147);
			 $('.list_view_content').css('overflow','auto');
		
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

		$(document.body).on("click",".previewPopup",function(){
				$('.inner_prev_page').html('Please Wait...');
				$('.preview_images').show();
			//	alert("sdf");
				//$('.web_dialog_overlay').show();
				//window.open('getPreview', '_blank');
					//alert('sdf');                                                	  
			
			$.ajax({
	         				type : "GET",
	         				url : "getPreview",
	         				contentType : "application/json",
	         				async : false,
	         				success : function(data) {
	         					//myStopFunction(myVar);
	         					$('.inner_prev_page').html(data);
	         					
	         				}

	             });
				});
		$(document.body).on("click",".previewInNewTab",function(){
			//	$('.inner_prev_page').html('Please Wait...');
				//$('.preview_images').show();
				//$('.web_dialog_overlay').show();
				window.open('getPreview', '_blank');
					//alert('sdf');                                                	  
	           		/* $.ajax({
	         				type : "GET",
	         				url : "getPreview",
	         				contentType : "application/json",
	         				async : false,
	         				success : function(data) {
	         					
	         					$('.inner_prev_page').html(data);
	         				}

	             });*/
				});

		// CLOSE THE FILE 
		$(document).on("click",".close_prev",function(){
			
			$('.preview_images').hide();
			$('.web_dialog_overlay').hide();
			
			});	

		$(document).on("click",".textClose span",function(){
			 $('.uploadForm1 >.uploadMultiple >ul>li').remove("li");
			$('#contactdiv_6').hide();
			 $('.web_dialog_overlay').hide();
			 

       	  $('#upload').attr("action", "uploadDocumentByJcr");
       	  $('#checkAttactmentPopup').val('tt');
			/* $('.uploadMultiple').html('');*/
			 
			});
		$(document).on("click",".textClose2 span",function(){
			 $('.uploadForm1 >.uploadMultiple >ul>li').remove("li");
			$('#contactdiv_616').hide();
			 $('.web_dialog_overlay').hide();
			/* $('.uploadMultiple').html('');*/
			 
			});


		$(document).on("click",".finishUpload",function(){

			 $('.uploadForm1 >.uploadMultiple >ul>li').remove("li");
			
			$('#contactdiv_6').hide();
			 $('.web_dialog_overlay').hide();
			 

	       	  $('#upload').attr("action", "uploadDocumentByJcr");
	       	  $('#checkAttactmentPopup').val('tt');
			/* $('.uploadMultiple').html('');*/
			 
			});
		$(document).on("click",".finishUpload2",function(){

			 $('.uploadForm1 >.uploadMultiple >ul>li').remove("li");
			
			$('#contactdiv_616').hide();
			 $('.web_dialog_overlay').hide();
			/* $('.uploadMultiple').html('');*/
			 
			});

		$(function() {
		      $('.datepicker').datepicker({dateFormat: 'dd/mm/yy'});
		});
		
		
		
		/* $(function() {
			 $( ".datepicker" ).datepicker();
			 });*/
		      /*
		       $(function() {
		               $("#datepicker").datepicker({ dateFormat: "dd/mm/yyyy" }).val()
		       });
		       */
			/*	
			 $(document).on("click",".note",function(){
					$('#notesnote').val('');
				})
			 */
		 
		 $('html').click(function() {
             $('.new_more_file').hide()
             return true;
		 });
		 
		 $('.new_more_file').click(function(event){
	         event.stopPropagation();
         });
		 
		var prev_height = $(window).height();
		var prev_width = $(window).width();
		//alert(prev_width);
		$('.preview_images').css('height',prev_height-40);
		$('.preview_images').css('width',(prev_width*60)/100);
		$('.inner_prev_page').css('height',prev_height -90);

		$(document).on("click",".space",function(event){
			    if (event.ctrlKey) {
		    	//alert("The CTRL key was pressed!");
				$(this).addClass('active_11');
				if($('#multiPath').val()==""){
					$('#multiPath').val(this.id);
				}else{
					var multiPath=$('#multiPath').val();
					if(!(multiPath.indexOf(this.id) != -1 )){
						//alert("dhi");
				$('#multiPath').val(multiPath+","+this.id);
				}else{
					//$('#multiPath').val(this.id);
				}
				}
		        } 
				else {
				// alert("The CTRL key was NOT pressed!");
					
					if($('#multiPath').val()==""){
						//$('#multiPath').val(this.id);
					$(this).addClass('active_11');
				$('#multiPath').val(this.id);
				}else{
					
					var multiPath=$('#multiPath').val();
					if(!(multiPath.indexOf(this.id) != -1 )){
					//	alert(1);
						$('li.active_11').removeClass('active_11');
						$('#multiPath').val(this.id);
						$(this).addClass('active_11');
							}else{

								$('li.active_11').removeClass('active_11');
								$('#multiPath').val(this.id);
								$(this).addClass('active_11');
							}
				}
				//	$('div.control').remove;
		        }
				 event.stopPropagation();
			});

		$(document).on("contextmenu",".space",function(event){
			   
					var multiPath=$('#multiPath').val();
					if(!(multiPath.indexOf(this.id) != -1 )){

						$('#multiPath').val(this.id);
						$('li.active_11').removeClass('active_11');
						$(this).addClass('active_11');
					}else{
					

						$(this).addClass('active_11');
					}
		     
				 event.stopPropagation();
			});

		$(document).on("click",".thum_view_middle1",function(event){
		    if (event.ctrlKey) {
		       // 	alert("The CTRL key was pressed!");
		       //	$(this).addClass('active');
		        } 
				else {
					//alert('By')
					// alert("The CTRL key was NOT pressed!");

				$('.select_box').removeClass('new_select_box');
				$('li.active_11').removeClass('active_11');
				$('#multiPath').val('');
		        }
				 event.stopPropagation();
			});	
			
			
		/*	$("html").click(function () {
		         
				     $('.active').removeClass('active');
				 
		   });*/
		
		
		 	
		 
	});



