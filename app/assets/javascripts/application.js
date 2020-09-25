//= require jquery
//= require datatables
//= require dataTables/jquery.dataTables
//= require rails-ujs
//= require datatables/dataTables.bootstrap4
//= require turbolinks
//= require libraries/headroom
//= require init


$(document).ready("turbolinks:load", function() {
    $("#dttb").dataTable();
  });
