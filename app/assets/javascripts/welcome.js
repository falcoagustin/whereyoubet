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

function toggleBet(match, buttonDOM) {
  button = $(buttonDOM);
  var length = betIds.length;
  var matchId = match.id;
  var index = betIds.indexOf(matchId);
  if (length == 3 && index == -1) return;
  if (length == 3 && index != -1) {
    //betIds.pop(matchId);
    removeMatch(matchId);
    toggleBetButton(button);
    return;
  }
  if (length < 3){
    if (index == -1) {
      addMatch(match);
      //betIds.push(matchId);
    }else {
      //betIds.pop(matchId);
      removeMatch(matchId);
    }
    toggleBetButton(button);
  }
}

function addMatch(match) {
  betIds.push(match.id);
  var form = $('#completeBetForm').append(
    '<div class="user-bet-row" id="match'+ match.id + '">' +
    '<label>' + match.local_ratio + '</label>' +
    '<label>' + match.visitor_ratio + '</label>' +
    '<label>' + match.tie_ratio + '</label>' +
    '<select> <option value="L"> Local </option> <option value="V"> Visitor </option> <option value="T"> Tie </option></select>' +
    '<div>' + match.name + '</div>'
  )
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
