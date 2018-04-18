# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('#witness_outside_witness').on "change", ->
    $('.extra-data').toggle()
  $('#witness_department_id').on "change", ->
    url = '/get_municipality/' + $(this).val() + '.json'
    $("#witness_municipality_id").find('option').not(':first').remove()
    $.get url, (data) ->
      $.each data, (key, value) ->
        $("#witness_municipality_id").append('<option value=' + value['id'] + '>' + value['name'] + '</option>')
  $('#witness_municipality_id').on "change", ->
    url = '/get_zone/' + $(this).val() + '.json'
    $("#witness_zone_id").find('option').not(':first').remove()
    $.get url, (data) ->
      $.each data, (key, value) ->
        $("#witness_zone_id").append('<option value=' + value['id'] + '>' + value['name'] + '</option>')
  $('#witness_zone_id').on "change", ->
    url = '/get_post/' + $(this).val() + '.json'
    $("#witness_post_id").find('option').not(':first').remove()
    $.get url, (data) ->
      $.each data, (key, value) ->
        $("#witness_post_id").append('<option value=' + value['id'] + '>' + value['name'] + '</option>')
