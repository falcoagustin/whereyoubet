// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require welcome.js
//= require bootstrap-sprockets
//= require_tree .

var menuSelections = ['#homeMenu', '#logInMenu', '#signUpMenu'];

function showSelectedMenu(selectedMenu) {
  for (var i = 0; i < menuSelections.length; i++) {
    var current = menuSelections[i];
    if (selectedMenu == current) {
      $(current).fadeIn();
    }else {
      $(current).fadeOut();
    }
  }
}
