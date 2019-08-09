// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .


$(document).ready(function(){
  $("button.fleft").click(function(){
    $("#fsignup").addClass("disnone");
    $("#flogin").removeClass("disnone");
     $(".fleft").addClass("active");
     $(".fright").removeClass("active");
     $("#new_user").trigger("reset");
     $("#loginform").trigger("reset");    
     $(".notice").html("");
  });

$("button.fright").click(function(){
    $("#fsignup").removeClass("disnone");
    $("#flogin").addClass("disnone");
     $(".fright").addClass("active");
     $(".fleft").removeClass("active");
     $("#new_user").trigger("reset");
     $("#loginform").trigger("reset");
      $(".notice").html("");
  });

});

