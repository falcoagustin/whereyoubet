var menuSelections = ['#logInMenu', '#signUpMenu'];
var betIds = [];

function showSelectedMenu(selectedMenu) {
  var logIn = $('#logInMenu');
  var signUp = $('#signUpMenu');
  if (selectedMenu == '#logInMenu') {
    signUp.fadeOut(200, () => logIn.fadeIn());
  }else {
    logIn.fadeOut(200, () => signUp.fadeIn());
  }
}

function goToHome() {
  window.location = "/";
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
    '<input type="hidden" name="completeBet[id' + betIds.length + ']" value="' + match.id + '"/>' +
    '<label>' + match.local_ratio + '</label>' +
    '<label>' + match.visitor_ratio + '</label>' +
    '<label>' + match.tie_ratio + '</label>' +
    '<select name="completeBet[select' + betIds.length + ']"> <option value="bet_on_local"> Local </option> <option value="bet_on_visitor"> Visitor </option> <option value="bet_on_tie"> Tie </option></select>' +
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
