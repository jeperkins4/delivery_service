$ ->
  $("#<%= file_name.pluralize %>").dataTable
    dom: "<'row'<'span7'l><'span5'f>r>t<'row'<'span7'i><'span5'p>>"
    pagingType: "simple_numbers"
    autoWidth: false
    processing: true
    order: [[0,'desc']]
    serverSide: true
    ajax: $("#<%= file_name.pluralize %>").data('source')
