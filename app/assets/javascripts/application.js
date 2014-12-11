// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require underscore
//= require gmaps/google
//= require google_analytics
//= require_tree .

$(document).on('ready page:load', function () {

//*--- Display About ---*//
  $(".about").click(function(){
    $("#overlay").fadeIn(1000);
    $("#landingContainer").fadeOut(1000);
	});

//*--- Hide About ---*//
  $("a.close").click(function(){
  	$("#overlay").fadeOut(1000);
  	$("#landingContainer").fadeIn(1000);
  });

//-------- Edit and Destroy on Show Page ------------//

	$(".commentArea").mouseover(function(){
		$(".editComment").fadeIn(500);
	});

	$(".commentArea").mouseleave(function(){
		$(".editComment").fadeOut(500);
	});

});