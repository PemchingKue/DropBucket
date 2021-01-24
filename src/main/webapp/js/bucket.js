$(document).ready(function () {
    console.log("ready!");
	
	//GLOBAL VARIABLE FOR CARDID
	var cardId;

	//fetch files in database when landing on dashboard
	fetchFiles();

	//highlight file when clicked
	$('#cardList').on('click', '.card', function() {
			//set global variable HERE!!
			cardId = this.id;
			$Divs = $(".card");
		    $Divs.removeClass("highlight");
		    $(this).addClass("highlight");
	
			console.log(cardId);
	});
	
	//delete file when using delete button	
	$('#delete').on('click', function() {
		
			var fileId = cardId;
			
			if(fileId === undefined){
				$('#deleteCheckModal').modal('toggle');
			}else{
				$.ajax({
			        url: '/delete',
			        type: 'POST',
					data: { id : fileId },
					
			        success: function () {
			
						console.log("success on deleting file");
						updateFiles();
						cardId = undefined;
						$('#deleteSuccessModal').modal('toggle');
						console.log(fileId);
			
			            //if fail it will give this error
			        }, error: function (e) {
			            console.log("failed to delete file");
						
			        }
		    	});				
			}

		
	});
	
	//download file when using download button	
	$('#download').on('click', function() {
		
			var fileId = cardId;
			
			if(fileId === undefined){
				$('#downloadCheckModal').modal('toggle');
			}else{
				$.ajax({
			        url: '/download',
			        type: 'GET',
					data: { id : fileId },
					
			        success: function () {
			
						console.log("success on download");
						window.location = "download?id=" + fileId;
						console.log(fileId);
			
			            //if fail it will give this error
			        }, error: function (e) {
			            console.log("failed to download");
						
			        }
			    });
			}

	});
	
}); //end of document.ready()


function fetchFiles(){
	
	$.ajax({
        url: '/files',
        type: 'POST',
		dataType: "json",

        success: function (data) {
            var DOM = $('#cardList');

            //GET DATA AND PARSE IT
            $.each(data, function (key, value) {
                createCard(DOM, key, value);
            });

            //if fail it will give this error
        }, error: function (e) {
            console.log("failed to fetch data");
			console.log(JSON.stringify(e));
        }
    });
	
}

function createCard(DOM, key, value){

    DOM.append(

        `
        <div class="card mt-4 mr-4 shadow" id="${value.fileId}" style="width: 227.4px;">

            <div class="card-body p-5">
                <i class="fas fa-file-download fa-4x" style="text-align: center; width: 100%; color: #495057;"></i>
            </div>

            <div class="card-footer" style="text-align: center;">
                ${value.fileName}
            </div>

        </div>
        `

    );

}

function updateFiles(){
	
		$.ajax({
        url: '/files',
        type: 'POST',
		dataType: "json",

        success: function (data) {
            var DOM = $('#cardList');

			//clear the div then fetch the data again
			document.getElementById("cardList").innerHTML = "";
			
            //GET DATA AND PARSE IT
            $.each(data, function (key, value) {
                createCard(DOM, key, value);
            });

            //if fail it will give this error
        }, error: function (e) {
            console.log("failed to update list");
			console.log(JSON.stringify(e));
        }
    });
	
}

function uploadSuccess(){
	$('#uploadSuccessModal').modal('toggle');
}

function fileSizeExceed(){
	$('#fileSizeExceedModal').modal('toggle');
}

function cPassSuccess(){
	$('#changePassSuccessModal').modal('toggle');
}