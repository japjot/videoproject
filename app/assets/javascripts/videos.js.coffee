# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $(".ratelink").click ->
    clicked_link = $(this)
    theid = $(this).attr("theid")
    $.ajax
      type: "POST"
      url: "/videos/" + theid + "/vote_up"
      dataType: "text"
      success: (output) ->
        clicked_link.parent().parent().find(".vote_tally").empty().append output
    false