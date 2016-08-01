$(function(){

    var ul = $('#upload ul');

    $('#drop a').click(function(){
        // Simulate a click on the file input button
        // to show the file browser dialog
        $(this).parent().find('input').click();
    });

    // Initialize the jQuery File Upload plugin
    $('#upload').fileupload({

        // This element will accept file drag/drop uploading
        dropZone: $('#drop'),

        // This function is called when a file is added to the queue;
        // either via the browse button, or via drag/drop:
        add: function (e, data) {
        	//alert("");
        	var folder=data.files[0].name;
        	if(folder.indexOf('@')>=0||folder.indexOf(',')>=0
					||folder.indexOf('*')>=0||folder.indexOf('>')>=0
					||folder.indexOf('<')>=0||folder.indexOf(')')>=0
					||folder.indexOf('(')>=0||folder.indexOf("'")>=0
					||folder.indexOf('/')>=0||folder.indexOf('\\')>=0
					||folder.indexOf('&')>=0){
					
        		showMsg('error','Please do not use characters like ./,@<>()*');
        		showMsg('error','File name is : '+folder);
			}
        	else{
            	if(data.files[0].name.indexOf(".exe")>=0 ){
                /*	if(data.files[0].name.indexOf(".exe")>=0 ||data.files[0].name.indexOf(".mp3") >=0
               			 ||data.files[0].name.indexOf(".mp4") >=0||data.files[0].name.indexOf(".avi") >=0){*/
        		showMsg('error',data.files[0].name+' not allowed');
             
             }else{
            	 if(data.files[0].size>50000000){
            		 showMsg('error','size of '+data.files[0].name+' not allowed');
            	 }else {
            		// alert($('#checkAttactmentPopup').val());
            		 if($('#checkAttactmentPopup').val()=='tt'){
            		 
            		 $.ajax({
     					type : "GET",
     					url : "checkDocExist",
     					data : {
     						'docPath' : folder,
     					},
     					contentType : "application/json",
     					async : true,
     					success : function(data1) {
     						//alert(data1);
     						if(data1=="true"){
     							if(confirm("Already Exist ! Do you want to make a copy of it ?"))
     								{
     					            var tpl = $('<li class="working"><input type="text" value="0" data-width="48" data-height="48"'+
     					                ' data-fgColor="#098D50" data-readOnly="1" data-bgColor="#ccc" /><div class="clear"></div><p></p><span></span></li>');
     					            // Append the file name and file size
     					            tpl.find('p').text(data.files[0].name)
     					                         .append('<i>' + formatFileSize(data.files[0].size) + '</i>');
     					            // Add the HTML to the UL element
     					            data.context = tpl.appendTo(ul);
     					            // Initialize the knob plugin
     					            tpl.find('input').knob();
     					            // Listen for clicks on the cancel icon
     					            tpl.find('span').click(function(){
     					                if(tpl.hasClass('working')){
     					                    jqXHR.abort();
     					                }
     					                tpl.fadeOut(function(){
     					                    tpl.remove();
     					                });
     					            });
     					            // Automatically upload the file once it is added to the queue
     					            var jqXHR = data.submit().success(function (result, textStatus, jqXHR) {
     					            var alt=result.substring(result.lastIndexOf(",")+1);
     					            result=result.substring(0,result.lastIndexOf(","));
     							//	alert(result);
     								$("#fileThumbView>ul").append(result);
     								// getFileSystem(folder);
     								
     								
     					            }); 
     								}}else{
            var tpl = $('<li class="working"><input type="text" value="0" data-width="48" data-height="48"'+
                ' data-fgColor="#098D50" data-readOnly="1" data-bgColor="#ccc" /><div class="clear"></div><p></p><span></span></li>');

            // Append the file name and file size
            tpl.find('p').text(data.files[0].name)
                         .append('<i>' + formatFileSize(data.files[0].size) + '</i>');
        
            // Add the HTML to the UL element
            data.context = tpl.appendTo(ul);

            // Initialize the knob plugin
            tpl.find('input').knob();

            // Listen for clicks on the cancel icon
            tpl.find('span').click(function(){

                if(tpl.hasClass('working')){
                    jqXHR.abort();
                }

                tpl.fadeOut(function(){
                    tpl.remove();
                });

            });

            // Automatically upload the file once it is added to the queue
            var jqXHR = data.submit().success(function (result, textStatus, jqXHR) {
            var alt=result.substring(result.lastIndexOf(",")+1);
            result=result.substring(0,result.lastIndexOf(","));
        //	alert(folder);
				$("#fileThumbView>ul").append(result);
			//	 getFileSystem(folder);
				
            }); 
     								
     								
     					}
            	
     					
     					
     					}
				});
            		 }else{
            			 if(data.files[0].name.indexOf(".jpg")<0 &&data.files[0].name.indexOf(".png") <0
                    			 &&data.files[0].name.indexOf(".bmp") <0&&data.files[0].name.indexOf(".pdf") <0&&data.files[0].name.indexOf(".doc") <0
                    			 &&data.files[0].name.indexOf(".docx") <0&&data.files[0].name.indexOf(".xls") <0&&data.files[0].name.indexOf(".xlsx") <0
                    			 &&data.files[0].name.indexOf(".ppt"&&data.files[0].name.indexOf(".pptx") <0) <0){
            				 showMsg('error',data.files[0].name+' not allowed');
                         
                         }else{
            			 
            	            var tpl = $('<li class="working"><input type="text" value="0" data-width="48" data-height="48"'+
            	                ' data-fgColor="#098D50" data-readOnly="1" data-bgColor="#ccc" /><div class="clear"></div><p></p><span></span></li>');
            	            // Append the file name and file size
            	            tpl.find('p').text(data.files[0].name)
            	                         .append('<i>' + formatFileSize(data.files[0].size) + '</i>');
            	            // Add the HTML to the UL element
            	            data.context = tpl.appendTo(ul);
            	            // Initialize the knob plugin
            	            tpl.find('input').knob();
            	            // Listen for clicks on the cancel icon
            	            tpl.find('span').click(function(){
            	                if(tpl.hasClass('working')){
            	                    jqXHR.abort();
            	                }
            	                tpl.fadeOut(function(){
            	                    tpl.remove();
            	                });
            	            });
            	            // Automatically upload the file once it is added to the queue
            	            var jqXHR = data.submit().success(function (result, textStatus, jqXHR) {
            	            // var alt=result.substring(result.lastIndexOf(",")+1);
            	            // result=result.substring(0,result.lastIndexOf(","));
            				// $("#attachmentID").append(result);
            				// alert(result);
            	            var rlt=$('<input/>').attr({ type: 'button', name:'btn1', value:result+' ------- Delete',onclick:'deleteAttachment(this)',id:result,class:'attachClass'});
            			//	var rlt1=$('<input/>').attr({ type: 'button', name:'btn1', value:'Delete',onclick:'deleteAttachment(this)',id:result});
            				$("#attlch").append(rlt);
            				//$("#attlch").append("<br>");
            			//	$("#attlch").append(rlt1);
            	            var attid=$('#attachmentID').val();
            	            // alert(attid);
            	            $('#attachmentID').attr({value:attid+result+','});
            	            // alert('s');
            				}); 
            		 }
            		 }
            	 }
        }
        }
        }
    ,
        progress: function(e, data){
            // Calculate the completion percentage of the upload
            var progress = parseInt(data.loaded / data.total * 100, 10);
            // Update the hidden input field and trigger a change
            // so that the jQuery knob plugin knows to update the dial
            data.context.find('input').val(progress).change();
          //  alert(data.files[0].name);
            	if(progress == 100){
                    data.context.removeClass('working');
                }
        },

        fail:function(e, data){
            // Something has gone wrong!
            data.context.addClass('error');
        }

    });


    // Prevent the default action when a file is dropped on the window
    $(document).on('drop dragover', function (e) {
        e.preventDefault();
    });

    // Helper function that formats the file sizes
    function formatFileSize(bytes) {
        if (typeof bytes !== 'number') {
            return '';
        }

        if (bytes >= 1000000000) {
            return (bytes / 1000000000).toFixed(2) + ' GB';
        }

        if (bytes >= 1000000) {
            return (bytes / 1000000).toFixed(2) + ' MB';
        }

        return (bytes / 1000).toFixed(2) + ' KB';
    }

    
});





$(function() {
  var progressTimer,
    progressbar = $( "#progressbar" ),
    progressLabel = $( ".progress-label" ),
    dialogButtons = [{
      text: "Cancel Download",
      click: closeDownload
    }],
    dialog = $( "#dialog" ).dialog({
      autoOpen: false,
      closeOnEscape: false,
      resizable: false,
      buttons: dialogButtons,
      open: function() {
        progressTimer = setTimeout( progress, 2000 );
      },
  /*    beforeClose: function() {
        downloadButton.button( "option", {
          disabled: false,
          label: "Start Download"
        });
      }*/
    }),
    downloadButton = $( "#downloadButton" )
      .button()
      .on( "click", function() {
       /* $( this ).button( "option", {
          disabled: true,
          label: "Downloading..."
        });*/
        dialog.dialog( "open" );
      });

  progressbar.progressbar({
    value: false,
    change: function() {
      progressLabel.text( "Current Progress: " + progressbar.progressbar( "value" ) + "%" );
    },
    complete: function() {
      progressLabel.text( "Complete!" );
      dialog.dialog( "option", "buttons", [{
        text: "Close",
        click: closeDownload
      }]);
      $(".ui-dialog button").last().focus();
    }
  });

  function progress() {
    var val = progressbar.progressbar( "value" ) || 0;

    progressbar.progressbar( "value", val + Math.floor( Math.random() * 3 ) );

    if ( val <= 99 ) {
      progressTimer = setTimeout( progress, 50 );
    }
  }

  function closeDownload() {
    clearTimeout( progressTimer );
    dialog
      .dialog( "option", "buttons", dialogButtons )
      .dialog( "close" );
    progressbar.progressbar( "value", false );
    progressLabel
      .text( "Starting download..." );
    downloadButton.focus();
  }
});








