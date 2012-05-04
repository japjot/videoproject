# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ -> 
	$('#invite_body').keydown ->
		if $("#invite_body").val().length<140 
			$('.invite-submit').show()
			$('#form_errors').empty()
		else
			$('.invite-submit').hide()
			$('#form_errors').empty().append('We\'re sorry, but you\'re message contains over 140 characters.  Current count:'+$('#invite_body').val().length)


	$('#invite_body').click ->
		if $("#invite_body").val().length<140 
			$('.invite-submit').show()
			$('#form_errors').empty()
		else 
			$('.invite-submit').hide()
			$('#form_errors').empty().append('We\'re sorry, but you\'re message contains over 140 characters.  Current count:'+$("#invite_body").val().length)

	$('#invite_body').mouseover ->
		if $("#invite_body").val().length<140 
			$('.invite-submit').show()
			$('#form_errors').empty()
		else 
			$('.invite-submit').hide()
			$('#form_errors').empty().append('We\'re sorry, but you\'re message contains over 140 characters.  Current count:'+$("#invite_body").val().length)



