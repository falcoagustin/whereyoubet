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
    removeMatch(index, matchId);
    toggleBetButton(button);
    return;
  }
  if (length < 3){
    if (index == -1) {
      addMatch(match);
    }else {
      //betIds.pop(matchId);
      removeMatch(index, matchId);
    }
    toggleBetButton(button);
  }
}

function addMatch(match) {
  betIds.push(match.id);
  var form = $('#completeBetForm').append(
    '<div class="user-bet-row" id="match'+ match.id + '">' +
    '<input type="hidden" name="completeBet[id' + betIds.lenght + ']" value="' + match.id + '"/>' +
    '<label>' + match.local_ratio + '</label>' +
    '<label>' + match.visitor_ratio + '</label>' +
    '<label>' + match.tie_ratio + '</label>' +
    '<select name="completeBet[select' + betIds.length + ']"> <option value="L"> Local </option> <option value="V"> Visitor </option> <option value="T"> Tie </option></select>' +
    '<div>' + match.name + '</div>'
  )
}

function removeMatch(index, matchId) {
  betIds.splice(index, 1);
  $('#match' + matchId).remove();
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
