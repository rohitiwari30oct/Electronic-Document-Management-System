// JavaScript Document

jQuery(document).ready(function() {
	
	
	
	$(document.body).on('click', '.share_option_dropdown' ,function(){
		//alert('Hi11');
		var share_top = $(this).offset().top;
		var share_left = $(this).offset().left;
		//alert(share_top);
		//alert(share_left)
		// FOR BOX 
		if($('.share_menu_dropdown').css('display')=='none')
		{
		//alert('Hi1');
		$('.share_menu_dropdown').css('display','block');
		//$('.share_menu_dropdown').css('top',share_top);
		//$('.share_menu_dropdown').css('left',share_left-457);
		}
		else {
		$('.share_menu_dropdown').css('display','none');
		//alert('Hi2');
		}
		});
	
	
	
	
	// CAN EDITE 
	$('.can_edit').click(function(){
		$('.can_text').show();
		$('.comment_text').hide();
		$('.view_text').hide();
		// ICON 
		$('.edite_icon').show();
		$('.view_icon').hide();
		$('.comment_icon').hide();
		// CHECK SIGN
		$('.can_edit >span').css('visibility','visible');
		$('.can_comment >span').css('visibility','hidden');
		$('.can_view >span').css('visibility','hidden');
		// FOR BOX 
		$('.share_menu_dropdown').hide();
		
		
	});
    // CAN EDITE 
	
	// CAN COMMENT 
	$('.can_comment').click(function(){
		
		$('.can_text').hide();
		$('.comment_text').show()
		$('.view_text').hide();
		// ICON
		$('.edite_icon').hide();
		$('.view_icon').hide()
		$('.comment_icon').show();
		// CHECK SIGN
		$('.can_edit >span').css('visibility','hidden');
		$('.can_comment >span').css('visibility','visible');
		$('.can_view >span').css('visibility','hidden');
		// FOR BOX 
		$('.share_menu_dropdown').hide();
		
	});
	// CAN COMMENT
	
	/// CAN VIEW 
	$('.can_view').click(function(){
		
		$('.can_text').hide();
		$('.comment_text').hide();
		$('.view_text').show();
		// ICON
		$('.edite_icon').hide();
		$('.view_icon').show();
		$('.comment_icon').hide();
		// CHECK SIGN
		$('.can_edit >span').css('visibility','hidden');
		$('.can_comment >span').css('visibility','hidden');
		$('.can_view >span').css('visibility','visible');
		// FOR BOX 
		$('.share_menu_dropdown').hide();
	});
	// CAN VIEW 
	
	
	
	
	
	
	
	});