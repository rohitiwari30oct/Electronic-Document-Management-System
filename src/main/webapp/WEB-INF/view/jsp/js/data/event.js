

function showHide(event) {
    var ele = document.getElementById("search_form");
    if (ele.style.display == "block") {
        ele.style.display = "none";
		$('.user_information').css('display','none');
		
    }
    else {
        ele.style.display = "block";
		$('.user_information').css('display','none');
    }
	event.stopPropagation();
}
function Hide() {
    var ele = document.getElementById("search_form");
    if (ele.style.display == "block") {
        ele.style.display = "none";
    }
}

function showHidetool() {
    var ele = document.getElementById("search_form_tool");
    if (ele.style.display == "block") {
        ele.style.display = "block";
        ele.style.opacity = "1";
    }
    else {
        ele.style.display = "block";
    }
}

function showHidemenuleft() {
    var ele = document.getElementById("left_margin");
    if (ele.style.display == "block") {
        ele.style.display = "block";
        ele.style.opacity = "1";
    }
    else {
        ele.style.display = "none!important";
    }
}
//----------/// ONLY FOR PAGE FORMAT CHANGE LEFT SIDE--//
function showHidepageleft() {
    var ele = document.getElementById("right_tab");
    if (ele.style.display == "block") {
        ele.style.display = "block";
        ele.style.opacity = "1";
    }
}


function showHidepageright() {
    var ele = document.getElementById("right_tab");
    if (ele.style.display == "block") {
        ele.style.display = "block";
        ele.style.width = "block";
        ele.style.float = "left";
    }
    else {
        ele.style.display = "none";
    }
}

function leftmenutool() {
    var ele = document.getElementById("open");
    if (ele.style.display == "block") {
        ele.style.display = "block";
    }
    else {
        ele.style.display = "block";
    }
}

//$(document).ready(function($){

//$('#accordion-3').dcAccordion({
//eventType: 'click',
//autoClose:false,
//saveState: false,
//disableLink: false,
//showCount: false,
//speed: 'slow'
//});	
//$('.left_margin').css('display','block');
//$('.ac-small').css('height','140px');
//});

jQuery(document).ready(function() {
    // initiate layout and plugins
    // App.init();
    // Charts.init();
    // Charts.initCharts();
    // Charts.initPieCharts();
    $('.row_content').click(fortool);
});

function lunchboxOpen(lunchID) {
    document.getElementById('lunch_' + lunchID).style.display = "block";
    document.getElementById('clasp_' + lunchID).innerHTML = "<a href=\"javascript:lunchboxClose('" + lunchID + "');\">Close Lunchbox " + lunchID + "...</a>";
}
function lunchboxClose(lunchID) {
    document.getElementById('lunch_' + lunchID).style.display = "none";
    document.getElementById('clasp_' + lunchID).innerHTML = "<a href=\"javascript:lunchboxOpen('" + lunchID + "');\">Open Lunchbox " + lunchID + "...</a>";
}

// to show and hide mail view panel
// to show and hide mail view panel
function toggleViewPanel() {
	$('.row_content').addClass('pading_main');
	$('.vsplitbar').removeClass('new_spertator');
	$('.mid_tab').css('top','80');
	$('.top_bottom_1').removeClass('top_margin');
	$('.mail_content').removeClass('new_mail_right_1');
	$('.mail_content').removeClass('mail_con_righ');
	$('.mail_content_1').removeClass('new_mail_light');
	$('.tab_main_div').removeClass('tab_left_con');
	$('.row_first').removeClass('mail_de_op');
	$('.top_tool_information').css('display','block');
	$('.row_left').removeClass('left_view_con')
    $('.mid_tab').attr('style', '');
    $('.mail_content').attr('style', '');
    $('.row_content').removeClass('left_view_mess');
    // reverting back from bottom view        
    //$('.mid_tab').css('height', '85%');
    // reverting back from left view
    $('.mid_tab').css('width', '100%');
    $('.mid_tab').css('float', '');
   // $('.mail_content').css('height', '37%');
    $('.mail_content').css('width', '100%');
    $('.mail_content').css('display', 'none');

    // turn off splitter 
    $('.vsplitbar').remove();
    $('.hsplitbar').remove();
    leftCalled = false;
    bottomCalled = false;
    leftPane = false;
    rightPane = false;
}
// to shift the view panel to left of the mailbox panel
function shiftViewLeft() {
    if (!leftPane) {
        toggleViewPanel();
		$('.mid_tab').removeClass('bottom_tab');
		$('.row_content').removeClass('pading_main');
		$('.vsplitbar').addClass('new_spertator');
		$('.mid_tab').css('top','46');
		$('.top_tool_information').css('display','none');
		$('.top_bottom_1').removeClass('top_margin');
		$('.mail_content').addClass('new_mail_right_1');
		$('.mail_content_1').addClass('new_mail_light');
		$('.tab_main_div').addClass('tab_left_con');
		
		$('.mail_content').removeClass('mail_right_con');
        $('.mid_tab').css('float', 'left');
		$('.row_left').addClass('left_view_con');
		$('.row_content').addClass('left_view_mess');
		$('.row_first').addClass('mail_de_op');
        //$('.mid_tab').css('width', '50%');

       // $('.mail_content').css('height', '85%');
        //$('.mail_content').css('width', '49%');
        $('.mail_content').css('display', 'block');
		$('.mail_content').css('top','46');
        if (!leftCalled) {
            $('#widget').unbind();
            $('#widget').splitter({type: 'v'});
            leftCalled = true;
        } else {
            $('.vsplitbar').css('display', '');
        }
        $('.hsplitbar').remove();
        bottomCalled = false;
        leftPane = true;
    }
}
var leftCalled = false;
var bottomCalled = false;
var leftPane = false;
var rightPane = false;

function shiftViewBottom() {
    if (!rightPane) {
		$('.mid_tab').addClass('bottom_tab');
		$('.row_content').addClass('pading_main');
		$('.vsplitbar').removeClass('new_spertator');
		$('.mid_tab').css('top','80');
		$('.top_tool_information').css('display','block');
		$('.top_bottom_1').addClass('top_margin');
		$('.mail_content').addClass('mail_right_con');
		$('.mail_content').removeClass('new_mail_right_1');
		$('.mail_content').removeClass('mail_con_righ');
		$('.mail_content_1').removeClass('new_mail_light');
		$('.tab_main_div').removeClass('tab_left_con');
		
	    $('.row_first').removeClass('mail_de_op');
		$('.row_left').removeClass('left_view_con')
		$('.row_content').removeClass('left_view_mess');
        toggleViewPanel();
        $('.mid_tab').css('height', '38%');
        $('.mail_content').css('display', 'block');
        //$('.mail_content').css('height', '37%');
		$('.mail_content').css('top','0');
		

        if (!bottomCalled) {
            $('#widget').unbind();
            $('#widget').splitter({type: 'h'});
            bottomCalled = true;
        } else {
            $('.hsplitbar').css('display', '');
        }
        $('.vsplitbar').remove();
        leftCalled = false;
        rightPane = true;
    }
}

function tabfirst() {

    if ($('.tab_first_content').css('display') == "block")
    {
		$('.tab_first_content').animate({
				height: "0px",
			},{
				duration: 500, 
				specialEasing: {
					height: "linear"
				},
				complete: function() {
					$('.tab_first_content').css('display', 'none');
				}
			}
		);
		
    }else {
		$('.tab_first_content').css('display', 'block');
		$('.tab_first_content').animate({
				height: "300px",
			},{
				duration: 500, 
				specialEasing: {
					height: "linear"
				},
				complete: function() {
					
				}
			}
		);
    }
}



function tabfirst1() {

    if ($('.tab_first_content1').css('display') == "block")
    {

        $('.tab_first_content1').animate({
				height: "0px",
			},{
				duration: 500, 
				specialEasing: {
					height: "linear"
				},
				complete: function() {
					$('.tab_first_content1').css('display', 'none');
				}
			}
		);

    }

    else {

        $('.tab_first_content1').css('display', 'block');
		$('.tab_first_content1').animate({
				height: "300px",
			},{
				duration: 500, 
				specialEasing: {
					height: "linear"
				},
				complete: function() {
					
				}
			}
		);


    }



}



function tabfirst2() {

    if ($('.tab_first_content2').css('display') == "block")
    {

        $('.tab_first_content2').animate({
				height: "0px",
			},{
				duration: 500, 
				specialEasing: {
					height: "linear"
				},
				complete: function() {
					$('.tab_first_content2').css('display', 'none');
				}
			}
		);

    }

    else {

        $('.tab_first_content2').css('display', 'block');
		$('.tab_first_content2').animate({
				height: "300px",
			},{
				duration: 500, 
				specialEasing: {
					height: "linear"
				},
				complete: function() {
					
				}
			}
		);


    }



}

function tabfirst3() {

    if ($('.tab_first_content3').css('display') == "block")
    {

        $('.tab_first_content3').animate({
				height: "0px",
			},{
				duration: 500, 
				specialEasing: {
					height: "linear"
				},
				complete: function() {
					$('.tab_first_content3').css('display', 'none');
				}
			}
		);

    }

    else {

        $('.tab_first_content3').css('display', 'block');
		$('.tab_first_content3').animate({
				height: "300px",
			},{
				duration: 500, 
				specialEasing: {
					height: "linear"
				},
				complete: function() {
					
				}
			}
		);


    }



}


function fortool()
{
    $('.search_form_tool').css('display', 'block');
    $('.row_content').removeClass('selected_row');
    $(this).addClass('selected_row');
}
function userinformation(e)
{

    if ($('.user_information').css('display') == 'none') {
		$('.search_form_1').css('display','none');


        $('.user_information').css('display', 'block');
		$('#search_form').css('display','none');

    }else {
         
		 $('.search_form_1').css('display','none');
        $('.user_information').css('display', 'none');

    }
	e.stopPropagation();
	

}


function option_here()
{
    if ($('.mail_down_option').css('display') == "none")
    {
        $('.mail_down_option').css('display', 'block');
    }

    else {

        $('.mail_down_option').css('display', 'none');

    }

}



function option_here_1(event)
{
    if ($('.mail_down_option_1').css('display') == "none")
    {
        $('.mail_down_option_1').css('display', 'block');
    }

    else {

        $('.mail_down_option_1').css('display', 'none');

    }
	event.stopPropagation();

}



function mail_forward()
{

    if ($('.your_option').css('display') == "block")
    {

        $('.your_option').css('display', 'none');
        $('.mail_forward').css('display', 'block');


    }

    else {
        $('.your_option').css('display', 'block');
        $('.mail_forward').css('display', 'none');

    }



}


function mail_forward_1()
{

    if ($('.your_option_1').css('display') == "block")
    {

        $('.your_option_1').css('display', 'none');
        $('.mail_forward_1').css('display', 'block');


    }

    else {
        $('.your_option_1').css('display', 'block');
        $('.mail_forward_1').css('display', 'none');

    }



}


function mail_forward_11()
{

    if ($('.your_option_1').css('display') == "block")
    {

        $('.your_option_1').css('display', 'none');
        $('.mail_forward_11').css('display', 'block');


    }

    else {
        $('.your_option_1').css('display', 'block');
        $('.mail_forward_11').css('display', 'none');

    }



}





function down_mail(event)
{


    if ($('.main_bottom_option').css('display') == "none")
    {

        $('.main_bottom_option').css('display', 'block');



    }


    else {

        $('.main_bottom_option').css('display', 'none');


    }

event.stopPropagation();
}



function bootom_forward() {


    if ($('.for_bottom').css('display') == "none")
    {

        $('.for_bottom').css('display', 'block');

    }

    else {


        $('.for_bottom').css('display', 'none');

    }

event.stopPropagation();
}


function mail_to(event) {


    if ($('.to_me').css('display') == "none")
    {

        $('.to_me').css('display', 'block');

    }

    else {

        $('.to_me').css('display', 'none');

    }

event.stopPropagation();

}

/// MOUSE OVER TOOL TIPS 
var popout=0;
$(document).ready(function(e) {
	
    $('.cheat_row').mouseover(function(){	
	    //$('.chat_info' ).offset({  top:$(this).offset().top - $(this).height(), left: $(this).offset().left + $(this).width()});
		

		//alert(window.scrollTop()+ window.innerHeight());
		var height = $(this).position().top + $('.chat_info').height();
		var innerheight =window.innerHeight + window.scrollY;
		if( height > innerheight)
		{	           
			   $('.chat_info' ).position({ top:$(this).position().top - (height-innerheight), left: $(this).position().left + $(this).width()});
			  		  
		}
		else
		{
			
			//$('.chat_info' ).position({ top:$(this).position().top , left: $(this).position().left + $(this).width()});
			$(".chat_info").css({ top:$(this).position().top   , left: $(this).position().left});
			
		}
		$('.chat_info').show();
	});
	
	$('.chat_info').mouseout(function(){
		popout=0;
	    $('.chat_info').hide();		
	});
	
	$('.chat_info').mouseover(function(){
		popout=1;
		$('.chat_info').show();		
	});
	
	$('.cheat_row').mouseout(function(){
		if(popout==0)
		{
			$('.chat_info').css('display','none');
		}
	});
	
	// SECOND CHAT STARED HERE (CHAT SEARCH )
	var adjustChatHeight;
	$('.cheat_row_11').mouseover(function(){	
		
		if ($('.tab_header').find('.icon').attr('class').indexOf('icon_minus') > -1){
			var chat_search_top = $('.chat_inner_content').offset().top + $('.chat_inner_content').height();
			var chat_search_1 = window.innerHeight + window.scrollY; 
			adjustChatHeight = chat_search_top - chat_search_1;
		}
		
	    //$('.chat_info' ).offset({  top:$(this).offset().top - $(this).height(), left: $(this).offset().left + $(this).width()});
		//alert(window.scrollTop()+ window.innerHeight());
		var height = $(this).position().top + $('.chat_info_1').height();
		var innerheight =window.innerHeight + window.scrollY;
		if( height > innerheight)
		{	           
			   $('.chat_info_1' ).css({ top:$(this).position().top - ((height-innerheight)), left: $(this).position().left 
			   + $(this).width()});			  
		}
		else
		{
			//$('.chat_info' ).position({ top:$(this).position().top , left: $(this).position().left + $(this).width()});
			$(".chat_info_1").css({ top:$(this).position().top  , left: $(this).position().left + $(this).width()});
		}
		$('.chat_info_1').show();
	});
	
	$('.chat_info_1').mouseout(function(){
		popout=0;
	    $('.chat_info_1').hide();		
	});
	
	$('.chat_info').mouseover(function(){
		popout=1;
		$('.chat_info').show();		
	});
	
	$('.cheat_row_11').mouseout(function(){
		if(popout==0)
		{
			$('.chat_info_1').css('display','none');
		}
	});



   // SECOND CHAT STARED HERE 	
	
	
	
	
    // CHAT OPTIONS(chat_h_right) STARED HERE
	var adjust_height;
	$('.chat_h_right').click(function(){
		
	    var chat_search_top = $(this).offset().top +  $('.chat_search').height();
		var chat_search_1 = window.innerHeight + window.scrollY;   
		if($('.chat_search').css('display')=='none')
		{
			$('.chat_search_11').css('display','none');
			if( chat_search_top > chat_search_1)
			{ 
				adjust_height =(chat_search_top - chat_search_1 ) ;
				$('.chat_search').css({bottom:adjust_height});				
            }
			else 
			{
				adjust_height == 0;
			}
			$('.chat_search').css('display','block');
			//$('.chat_search').offset( { top:($(this).offset().top-adjust_height),left:$(this).offset().left + $(this).width() } );
			//$('.chat_search').offset( { top:0, left:0);
		}
		else
		{
			
			$('.chat_search').css('display','none');
		}

	});
	
	// CHAT OPTION END
	
	
	
			/// Chat Downarrow Only Option Here 
	$('.h_drop').click(function(){
		 var adjust_height = 0;
		 var chat_search_top = $(this).offset().top +  $('.chat_search').height();
		 var chat_search_1 = window.innerHeight + window.scrollY;
             
		
		if($('.chat_search_11').css('display')=='none')
		{
			//var chat_info = $('.chat_info').offset().bottom;
			$('.chat_search').css('display','none');
		
			if( chat_search_top > chat_search_1)
			{
				 //var adjust_height =($(this).offset().top - (chat_search_top - chat_search_1 )) ;
				//$('.chat_search').offset({ top: adjust_height});
				 adjust_height = chat_search_top - chat_search_1;
				 $('.all_chat_option').css( { bottom:adjust_height + 10,left:$('.chat_h_right').offset().left + $('.chat_h_right').width() } );
			}			 
			$('.chat_search_11').css('display','block');		
		}
		else
		{
			
			$('.chat_search_11').css('display','none');
		}

	});
		
		
		
		/// CHAT DOWN ARROW EVENT

//// Part 1
$('.chat_down_main ul li').click(function(){
	
	if($('.chat_down_submenu').css('display')=='none'){
		
		    $('.chat_down_submenu').css('display','block');
			$('.chat_downarrow').css('display','none')
		
		}
	
	}
);		

/// Part 2
$('.chat_main_menu').click(function(){
	
	if($('.chat_downarrow').css('display')=='none'){
		$('.chat_downarrow').css('display','block');
		$('.chat_down_submenu').css('display','none');
		
		
		}
	
	
	});
	
	/// Chat Menu Stared Here 
	$('.chat_status_menu').click(function(){
       
	   if($('.chat_status').css('display')=='none'){
		   
		   $('.chat_status').css('display','block');
		   $('.Blocked_status').css('display','none');
		   $('.Invites_status').css('display','none');
		   $('.Share_status').css('display','none');
		   
		   }
	   
	   
	});
		
			/// Invites Stared Here 
	$('.invites_menu').click(function(){
	
	   if($('.Blocked_status').css('display')=='none'){
		   
		   $('.chat_status').css('display','none');
		   $('.Blocked_status').css('display','block');
		   $('.Invites_status').css('display','none');
		   $('.Share_status').css('display','none');
		   
		   }
	});
	
				/// Invites Stared Here 
	$('.blocked_menu').click(function(){
	
	   if($('.Invites_status').css('display')=='none'){
		   
		   $('.chat_status').css('display','none');
		   $('.Blocked_status').css('display','none');
		   $('.Invites_status').css('display','block');
		   $('.Share_status').css('display','none');
		   
		   }

	});
	
					/// Invites Stared Here 
	$('.share_your_menu').click(function(){
	
  if($('.Share_status').css('display')=='none'){
		   
		   $('.chat_status').css('display','none');
		   $('.Blocked_status').css('display','none');
		   $('.Invites_status').css('display','none');
		   $('.Share_status').css('display','block');
		   
		   }
	});
	
	// CHAT SIGH OUT BOX 
	$('.chat_out').click(function(){
		if($('.chat_box_inner').css('display')=='block'){
			
			
			$('.chat_sign_box').css('display','block');
			$('.chat_box_inner').css('display','none');
			$('.chat_search_11').css('display','none')
			
			
			
			}
		
		});
		
		
			// CHAT SIGN IN BOX 
	$('.chat_sign_1_box').click(function(){
		
		if($('.chat_box_inner').css('display')=='none'){
			
			
			$('.chat_sign_box').css('display','none');
			$('.chat_box_inner').css('display','block');
			
			
			
			}
			

		
		});
		
		// BODY ONCLICK 
		$('body').click(function(e){
			 
			 
			})
		
	});