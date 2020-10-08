//= require jquery
//= require datatables
//= require dataTables/jquery.dataTables
//= require rails-ujs
//= require datatables/dataTables.bootstrap4
//= require turbolinks
//= require bootstrap
//= require libraries/headroom
//= require init
//= require_tree


$(document).on('turbolinks:load', function() {
  $("#dttb").dataTable();
  });