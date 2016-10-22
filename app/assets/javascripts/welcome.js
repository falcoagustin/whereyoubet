var menuSelections = ['#homeMenu', '#logInMenu', '#signUpMenu'];
var betIds = [];

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

function toggleBet(matchId, buttonDOM) {
  button = $(buttonDOM);
  if (betIds.indexOf(matchId) == -1) betIds.push(matchId);
  if (betIds.length > 3) {
    betIds.pop(matchId);
  }else {
    toggleBetButton(button);
  }
}

function toggleBetButton(button) {
  if (button.attr('class').includes('inactive')) {
    button.addClass('bet-button-active');
    button.removeClass('bet-button-inactive');
  } else {
    button.addClass('bet-button-inactive');
    button.removeClass('bet-button-active');
  }
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
