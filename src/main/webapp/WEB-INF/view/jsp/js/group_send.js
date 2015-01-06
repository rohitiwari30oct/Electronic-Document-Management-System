// JavaScript Document

/// LEFT PART CONTENT 
	
	      $('.new_11').click(function(){
			  
			  $('div.left_user1').removeClass('left_user1');
			  
			window.open_here =  $(this).addClass('left_user1');
			  
			  });
			  $(document.body).on('click', '.new_11' ,function(){
			
			//.children($('.go_text'));
			$('div.go_right_to_left1').removeClass('go_right_to_left1');
		           
				   $('div.left_user1').removeClass('left_user1');
			  
			      window.open_here =  $(this).addClass('left_user1');
		
		});
	
	/// LEFT PART CONTENT END 
	
   /// LEFT PART GO CONTENT 
	    $('.go_here1').click(function(){
			//alert('hi')
			//alert($('.left_user').html());
			
			var div_value = $('.left_user1').html();
			//alert(div_value);
			
			     $('.left_part1').find('.left_user1').addClass('active_go1');
				//.append('<div class="right_text">' + div_value +'</div>')
				 $('.right_part_11').append(' <tr class="right_text1"> <td class="go_text1">' + div_value + '</td><td><input type="checkbox" /></td><td><input type="checkbox" /></td><td><input type="checkbox" /></td><td><input type="checkbox" /></td></tr>')
				 open_here.hide(this);
			
		});
		
    /// LEFT PART GO CONTENT  END 
	
	/// RIGHT PART COME CONTENT 
		
	    $(document.body).on('click', '.right_text1' ,function(){
			
			//.children($('.go_text'));
			$('td.go_right_to_left1').removeClass('go_right_to_left1');
			/// NEW HERE
			$('.right_text1').removeClass('go_right_to_left1');
			//window.right_content = $(this).addClass('go_right_to_left');
		        $(this).addClass('go_right_to_left_tr');
		   /// NEW END HERE		
			window.right_content = $(this).children($('.go_text1')).addClass('go_right_to_left1');
		
		});
	/// RIGHT PART COME CONTENT END 
	
	/// RIGHT PART COME CONTENT 	
		
		$('.come_here1').click(function(){
			//alert('hi')
			//alert($('.go_right_to_left').html());
			
			var div_value_right = $('.go_right_to_left1').html();
			//alert(div_value_right);
			
			      $('.right_part1').find('.go_right_to_left1').addClass('active_go_right1');
				  $('.right_part1').find('.active_go_right1').hide(this);
				 $('.left_part1').append('<div class="right_text new_11">' + div_value_right +'</div>');
			   
			
		});
		
		/// RIGHT PART COME CONTENT 