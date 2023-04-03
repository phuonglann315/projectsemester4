
$(document).ready(function() {

	$("#taxcode").keyup(function(){
		var taxcode = document.getElementById("taxcode").value;
		var regExNumber = /^[0-9]+$/
		      if(!regExNumber.test(taxcode)){
		         $('#errorTax').html('<span class="error-test" style="color: red; font-size: 16px;">Taxcode must be consists of only numbers!</span>');  
		         document.querySelector('#submitAgency').disabled = true;
		     }else{
		    	 $('#errorTax').html('');
		    	 document.querySelector('#submitAgency').disabled = false;
		     }		
	});
	
	
	

});