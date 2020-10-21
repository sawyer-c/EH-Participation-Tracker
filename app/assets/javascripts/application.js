//= require jquery
//= require datatables
//= require dataTables/jquery.dataTables
//= require rails-ujs
//= require datatables/dataTables.bootstrap4
//= require turbolinks
//= require libraries/headroom
//= require init
//= require_tree

$(document).on('turbolinks:load', function() {
  $("#dttb").dataTable();
  localStorage.setItem('themeSwitch', 'light');
  });


  document.addEventListener('turbolinks:load', function() {
    // Initialize theme
    if (localStorage.getItem('themeSwitch') == 'dark') {
      $("body").attr("data-theme", "dark");
      localStorage.setItem('themeSwitch', 'dark');
      document.getElementById("themeSwitch").checked = true;
    } else {
      $("body").attr("data-theme", "light");
      localStorage.setItem('themeSwitch', 'light');
      document.getElementById("themeSwitch").checked = false;
    }

    // Change theme
    $('#themeSwitch').change(function() {
     if ($(this).prop("checked")) {
       $("body").attr("data-theme", "dark");
       localStorage.setItem('themeSwitch', 'dark');
     } else {
       $("body").attr("data-theme", "light");
       localStorage.setItem('themeSwitch', 'light');
     }
    });
  });






