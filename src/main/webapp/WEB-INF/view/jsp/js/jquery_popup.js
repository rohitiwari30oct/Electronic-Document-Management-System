$(document).ready(function() {
    setTimeout(popup, 3000);

    function popup() {
        $("#logindiv").css("display", "block");
    }

	$(document).on("click","#login #cancel",function(){
        $(this).parent().parent().hide();
    });

	$(document).on("click",".onclick",function(){
        $("#contactdiv").css("display", "block");
    });
	$(document).on("click",".onclick_3",function(){
        $("#contactdiv_3").css("display", "block");
    });

	$(document).on("click",".onclick_4",function(){
        $("#contactdiv_4").css("display", "block");
    });

	$(document).on("click",".onclick_5",function(){
        $("#contactdiv_5").css("display", "block");
    });

	$(document).on("click",".right_upload_folder",function(){
        $("#contactdiv_6").css("display", "block");
        /*if($('.uploadHide').css('display'=='none'))
        {
                 $('.uploadHide').show();

        }
        else 
        {
             $('.uploadHide').hide()
       
        }*/
    });
	$(document).on("click",".right_upload_folder2",function(){
        $("#contactdiv_616").css("display", "block");
        /*if($('.uploadHide').css('display'=='none'))
        {
                 $('.uploadHide').show();

        }
        else 
        {
             $('.uploadHide').hide()
       
        }*/
    });

	


	$(document).on("click",".right_create_folder",function(){
        $("#contactdiv_66").css("display", "block");
    });

	$(document).on("click",".renameFolder",function(){
        $("#contactdiv_666").css("display", "block");
    });

	$(document).on("click",".more_delete",function(){
        $("#contactdiv_77").css("display", "block");
    });

	$(document).on("click","#contact #cancel",function(){
        $(this).parent().parent().hide();
    });


//contact form popup send-button click event

	$(document).on("click","#send",function(){
	
        var name = $("#name").val();
        var email = $("#email").val();
        var contact = $("#contactno").val();
        var message = $("#message").val();
        if (name == "" || email == "" || contactno == "" || message == "")
        {
            alert("Please Fill All Fields");
        }
        else
        {
            if (validateEmail(email)) {
                $("#contactdiv").css("display", "none");
            }
            else {
                alert('Invalid Email Address');
            }
            function validateEmail(email) {
                var filter = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;

                if (filter.test(email)) {
                    return true;
                }
                else {
                    return false;
                }
            }
        }
    });


//login form popup login-button click event

		$(document).on("click","#loginbtn",function(){
        var name = $("#username").val();
        var password = $("#password").val();
        if (username == "" || password == "")
        {
            alert("Username or Password was Wrong");
        }
        else
        {
            $("#logindiv").css("display", "none");
        }
    });

});

 