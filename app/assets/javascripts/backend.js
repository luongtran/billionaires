//= require jquery
//= require jquery_ujs
//= require bootstrap/dist/js/bootstrap
//= require metisMenu/dist/metisMenu
//= require raphael/raphael
//= require morris.js/morris
//= require jquery.nicescroll
//= require tinymce/tinymce.min
//= require dropzone/dist/dropzone
//= require jquery_nested_form
//= require form_dropzone
//= require dashboard

$(function() {
  $(".preloader").fadeOut();
  $('#side-menu').metisMenu();
  // Javascript to enable link to tab
  var hash = document.location.hash;
  if (hash) {
    $('.nav-tabs a[href="'+hash+'"]').tab('show');
  }
  // Change hash for page-reload
  $('.nav-tabs a').on('shown.bs.tab', function (e) {
    window.location.hash = e.target.hash;
  });
});
