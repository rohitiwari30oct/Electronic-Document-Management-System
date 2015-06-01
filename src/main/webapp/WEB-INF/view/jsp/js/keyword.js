// JavaScript Document

$(document).ready(function() {

	$(document).on("click",".keyword_add",function(){

    	$(".edit_keyword").attr('class','add_keyword');
    	$(".edit_keyword_exit").attr('class','add_keyword_exit');
    	$(".edit_keyword").attr('class','add_keyword');

    	$("#add_keywordkey").val('Date');
    	$("#add_keywordid").val('');
		$('.key_word_box').show();
		$('.web_dialog_overlay').show();

			
				

		
		});

	$(document).on("click",".keyword_edit",function(){
	
		
		    $('.key_word_box').show();
			$('.web_dialog_overlay').show();

			
				

		
		});
		
	
		
		// CANCEL KEY WORD BOX 

	$(document).on("click",".cancel_keyword",function(){
			
			//alert('Hi')
			$('.key_word_box').hide();
			$('.web_dialog_overlay').hide();
			
			});
		// CANCEL KEY WOR BOX 
		
		
		/// DELETE THE ROW 
	
		
		/// DELETE THE ROW 
		
		
	
	
	
	});