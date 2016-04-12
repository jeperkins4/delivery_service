//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require bootstrap-datepicker
//= require bootstrap-timepicker
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require dataTables/extras/dataTables.tableTools
//= require dataTables/extras/dataTables.responsive
//= require cocoon
//= require underscore
//= require moment
//= require daterangepicker
//= require gmaps/google
//= require_tree .
//= require_self

$ ->
  $('.dropdown-toggle').dropdown()

  $(".datepicker").datepicker
    #comment the beforeShow handler if you want to see the ugly overlay
    autoclose: true
    todayHighlight: true
    format: "yyyy-mm-dd"
    autoclose: true
    beforeShow: ->
      setTimeout (->
        $(".datepicker").css "z-index", 99999999999999
        return
      ), 0
      return
  $("#main").on "pjax:end", ->
    $("select").chosen allow_single_deselect: true
    $(".datepicker").datepicker

  $.ajaxSetup beforeSend: (xhr) ->
    xhr.setRequestHeader "Accept", "text/javascript"
    xhr.setRequestHeader "Accept", "application/json"

  $.ajaxSetup headers:
    "X-CSRF-Token": $("meta[name=\"csrf-token\"]").attr("content")
