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


$ ->
  $(".follow").live "click", ->
    user_id = $(this).prev().attr("value")
    this_button = $(this)
    $.ajax
      data:
        "user[user_id]": user_id

      type: "POST"
      url: "/users/follow_user"
      dataType: "text"
      success: (output) ->
        this_button.attr "class", "unfollow btn btn-danger"
        this_button.attr "value", "Unfollow"

    false

$ ->
  $(".unfollow").live "click", ->
    user_id = $(this).prev().attr("value")
    this_button = $(this)
    $.ajax
      data:
        "user[user_id]": user_id

      type: "POST"
      url: "/users/unfollow_user"
      dataType: "text"
      success: (output) ->
        this_button.attr "class", "follow btn btn-success"
        this_button.attr "value", "Follow"
    false
