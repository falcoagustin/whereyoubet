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
  var length = betIds.length;
  var index = betIds.indexOf(matchId);
  if (length == 3 && index == -1) return;
  if (length == 3 && index != -1) {
    betIds.pop(matchId);
    toggleBetButton(button);
    return;
  }
  if (length < 3){
    if (index == -1) {
      betIds.push(matchId);
    }else {
      betIds.pop(matchId);
    }
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
