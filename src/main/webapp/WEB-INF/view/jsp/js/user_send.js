// JavaScript Document

/// LEFT PART CONTENT 

$('.new_1').click(function() {

	$('div.left_user').removeClass('left_user');

	window.open_here = $(this).addClass('left_user');

});
$(document.body).on('click', '.new_1', function() {

	// .children($('.go_text'));
	$('div.go_right_to_left').removeClass('go_right_to_left');

	$('div.left_user').removeClass('left_user');

	window.open_here = $(this).addClass('left_user');

});

// / LEFT PART CONTENT END

// / LEFT PART GO CONTENT
$('.go_here')
		.click(
				function() {
					// alert('hi')
					// alert($('.left_user').html());

					var div_value = $('.left_user').html();
					if( div_value == null)
					{
						alert('Please Select The Value !')
						
						}
					else {
					// alert(div_value);
					
					$('.left_part').find('.left_user').addClass('active_go');
					// .append('<div class="right_text">' + div_value +'</div>')
					$('.right_part_1')
							.append(
									' <tr class="right_text"> <td class="go_text">'
											+ div_value
											+ '</td><td><input type="checkbox" onclick="assignPermissions(this.value)" name="userpermission" value="'
											+ div_value
											+ ',ur" id="'
											+ div_value.replace("@", "")
													.replace(".", "")
											+ 'ur" /></td><td><input type="checkbox" onclick="assignPermissions(this.value)"  name="userpermission" value="'
											+ div_value
											+ ',uw"  id="'
											+ div_value.replace("@", "")
													.replace(".", "")
											+ 'uw"/></td><td><input type="checkbox" onclick="assignPermissions(this.value)"  name="userpermission" value="'
											+ div_value
											+ ',ud"  id="'
											+ div_value.replace("@", "")
													.replace(".", "")
											+ 'ud"/></td><td><input type="checkbox" onclick="assignPermissions(this.value)"  name="userpermission" value="'
											+ div_value
											+ ',us"  id="'
											+ div_value.replace("@", "")
													.replace(".", "")
											+ 'us"/></td></tr>');
											$('div.left_user').removeClass('left_user');
											
					open_here.hide(this);
					}

				});

// / LEFT PART GO CONTENT END

// / RIGHT PART COME CONTENT

$(document.body).on(
		'click',
		'.right_text',
		function() {
			// alert("gjh");
			// .children($('.go_text'));
			$('td.go_right_to_left').removeClass('go_right_to_left');
			// / NEW HERE
			$('.right_text1').removeClass('go_right_to_left1');
			// window.right_content = $(this).addClass('go_right_to_left');
			$(this).addClass('go_right_to_left_tr');
			// / NEW END HERE

			// window.right_content = $(this).addClass('go_right_to_left');
			window.right_content = $(this).children($('.go_text')).addClass(
					'go_right_to_left');

		});
// / RIGHT PART COME CONTENT END

// / RIGHT PART COME CONTENT

$('.come_here').click(
		function() {
			// alert('hi')
			// alert($('.go_right_to_left').html());

			var div_value_right = $('.go_right_to_left').html();
			alert(div_value_right);
      if(div_value_right == null)
	  {
		   alert('Please Select The Value ');
		  
		  
		  }
	  else {
			$('.right_part').find('.go_right_to_left').addClass(
					'active_go_right');
			$('.right_part').find('.active_go_right').hide(this);
			$('.left_part').append('<div class="right_text new_1">' + div_value_right + '</div>');
		      $('td.go_right_to_left').removeClass('go_right_to_left');					
	  }
		});

// / RIGHT PART COME CONTENT

// / TAB CONTENT STRAED HERE

// USER TAB STARED HERE
$('.user_tab').click(
		function() {
			// alert('Hi');
			$('.user_tab').addClass('active_user');
			$('.roles_tab').removeClass('active_roles');

			if ($('.user_tab_content').css('display') == 'block'
					|| $('.user_tab_content').css('display') == 'none') {
				$('.user_tab_content').css('display', 'block');
				$('.role_tab_content').css('display', 'none');

			}

		});

// / USER TAB END HERE

// ROLE TAB STARED HERE
$('.roles_tab').click(function() {
	$('.user_tab').removeClass('active_user');
	$('.roles_tab').addClass('active_roles');
	// alert('By');

	if ($('.role_tab_content').css('display') == 'none') {

		$('.role_tab_content').css('display', 'block');
		$('.user_tab_content').css('display', 'none');

	}

});

// / ROLE TAB END HERE
$('.close_user_box').click(function() {

	$('.share_option').hide(1000);
	$('.web_dialog_overlay').hide();

});

// / TAB CONTENT END HERE
