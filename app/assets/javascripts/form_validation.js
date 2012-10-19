function is_valid(file){
	if (is_valid_file_type(file) || is_not_empty(file)){
		return true
	}else{
	return false
	}
}

function is_valid_file_type(file){
	if (file.match(/(tab|txt)$/)){
		notify('');
		return true
	}else{
		notify('file type is not valid. Please upload .tab or .txt file')
		return false
	}
}

function is_not_empty(file){
	if (file.length > 0){
		notify('');
		return true
	}else{
		notify('Please select file for upload.')
		return false
	}
}

function notify(message){
	$('#warn_notice').html(message)
}

jQuery(function (){
	$('#myfile').change(function(e){
		is_valid($('#myfile').val())
	});
	$('#the_button').click(function(e){
		if (is_valid($('#myfile').val())){
			$('#document_form').submit();
		}else{
			return false;
		}
	});
});