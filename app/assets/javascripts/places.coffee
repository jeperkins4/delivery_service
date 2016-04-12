# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $("#places").dataTable
    pagingType: "simple_numbers"
    autoWidth: false
    processing: true
    order: [[0,'desc']]
    serverSide: true
    ajax: $("#places").data('source')
