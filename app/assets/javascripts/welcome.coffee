# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $("#welcomes").dataTable
    dom: "<'row'<'span7'l><'span5'f>r>t<'row'<'span7'i><'span5'p>>"
    pagingType: "simple_numbers"
    autoWidth: false
    processing: true
    order: [[0,'desc']]
    serverSide: true
    ajax: $("#welcomes").data('source')

  unless $("#map").length is 0
    franchises = $("#map").data("franchise")
    gmaps_opts =
      zoom: 5
      zoomControl: false
      center: new google.maps.LatLng(34, -91.6)
    handler = Gmaps.build("Google")
    handler.resetBounds()
    handler.buildMap
      provider: gmaps_opts
      auto_adjust: true
      internal:
        id: "map"
    , ->
      markers = handler.addMarkers(franchises)
      handler.fitMapToBounds()
      handler.getMap().setZoom 5
      return

