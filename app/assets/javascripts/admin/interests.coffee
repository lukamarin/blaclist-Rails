# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('#interests').ready ->
    $(this).on 'ajax:success', (xhr, data, status) ->
      notification = $("<p class='success-notification'>Saved</p>")
      $('#info-container').append(notification)
      notification.fadeOut 2500, ->
        $(this).remove();
