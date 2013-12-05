// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require tinymce
// Loads all Bootstrap javascripts
//= require bootstrap
//= require_tree .

$().ready(function() {
  $('#coda-slider-1').codaSlider({
    autoSlide: true,
    autoSlideInterval: 6000,
    autoSlideStopWhenClicked: true,
    dynamicTabs: false,
	dynamicArrows:false
  });
});

// handle displaying of flash alert and notice messages
$(function() {
  // $('div.alert').css({'zIndex': '0'});
  $('div.alert').slideDown(600, 'linear', function() {
    $(this).delay(4000).slideUp("normal");
  });
  // $('div.notice').css({'zIndex': '0'});
  $('div.notice').slideDown(600, 'linear', function() {
    $(this).delay(4000).slideUp("normal");
  });
  
  $('.close-it').click(function(){
    $(this).parent().slideUp('fast');
    return false;
  });
  return false;
});