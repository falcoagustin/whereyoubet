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

function goToHome() {
  window.location = "/";
}

function hideAccountsDropdown() {
  $('#accountsDropdown').css('display', 'none');
}

$( document ).ready(function() {
  $("#accounts").hover(
    function() { $('#accountsDropdown').css('display', 'block'); }
  );
  $("#accountsDropdown").hover(
    function() { },
    function() { $('#accountsDropdown').css('display', 'none'); }
  );
});
