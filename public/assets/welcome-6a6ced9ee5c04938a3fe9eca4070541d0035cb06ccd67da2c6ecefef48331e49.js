(function() {
  $(function() {
    var franchises, gmaps_opts, handler;
    $("#welcomes").dataTable({
      dom: "<'row'<'span7'l><'span5'f>r>t<'row'<'span7'i><'span5'p>>",
      pagingType: "simple_numbers",
      autoWidth: false,
      processing: true,
      order: [[0, 'desc']],
      serverSide: true,
      ajax: $("#welcomes").data('source')
    });
    if ($("#map").length !== 0) {
      franchises = $("#map").data("franchise");
      gmaps_opts = {
        zoom: 5,
        zoomControl: false,
        center: new google.maps.LatLng(34, -91.6)
      };
      handler = Gmaps.build("Google");
      handler.resetBounds();
      return handler.buildMap({
        provider: gmaps_opts,
        auto_adjust: true,
        internal: {
          id: "map"
        }
      }, function() {
        var markers;
        markers = handler.addMarkers(franchises);
        handler.fitMapToBounds();
        handler.getMap().setZoom(5);
      });
    }
  });

}).call(this);
