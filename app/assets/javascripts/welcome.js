const menuSelections = ['#logInMenu', '#signUpMenu'];
const betValues = {
  bet_on_local: 'Local',
  bet_on_visitor: 'Visitor',
  bet_on_tie: 'Tie'
}
var betIds = [];

$(document).ready(function(){
  $('select').click(function(e){
    e.stopPropagation();
  });
});

function showSelectedMenu(selectedMenu) {
  var logIn = $('#logInMenu');
  var signUp = $('#signUpMenu');
  if (selectedMenu == '#logInMenu') {
    signUp.fadeOut(200, function() {
      logIn.fadeIn();
    });
  }else {
    logIn.fadeOut(200, function() {
      signUp.fadeIn();
    });
  }
}

function goToHome() {
  window.location = "/";
}

function toggleBet(matchId) {
  var length = betIds.length;
  var index = betIds.indexOf(matchId);
  if (length == 3 && index == -1) return;
  if (length == 3 && index != -1) {
    removeMatch(index, matchId);
    toggleBetRow(matchId);
    return;
  }
  if (length < 3){
    if (index == -1) {
      var match = buildMatchFromHtml(matchId);
      addMatch(match);
    }else {
      removeMatch(index, matchId);
    }
    toggleBetRow(matchId);
  }
}

function buildMatchFromHtml(matchId) {
  var matchDOMContainer = $('#match' + matchId)
  var modelDOMelem = matchDOMContainer.find('div');
  var selectDOM = matchDOMContainer.find('select');

  // TODO: Find a better way to do this.
  var name = $(modelDOMelem[0]).data('name');
  var local_ratio = $(modelDOMelem[1]).data('local-ratio');
  var visitor_ratio = $(modelDOMelem[2]).data('visitor-ratio');
  var tie_ratio = $(modelDOMelem[3]).data('tie-ratio');
  var betOn = parseBetValue(selectDOM[0].value);
  var betOnValue = selectDOM[0].value;

  return {
    id: matchId,
    name: name,
    local_ratio: local_ratio,
    visitor_ratio: visitor_ratio,
    tie_ratio: tie_ratio,
    betOn: betOn,
    betOnValue: betOnValue
  }
}

function parseBetValue(value) {
  return betValues[value];
}

function addMatch(match) {
  betIds.push(match.id);
  var form = $('#completeBetForm').append(
    '<div class="user-bet-row" id="betMatch'+ match.id + '">' +
    '<input type="hidden" name="completeBet[id' + betIds.length + ']" value="' + match.id + '"/>' +
    '<label>' + match.local_ratio + '</label>' +
    '<label>' + match.visitor_ratio + '</label>' +
    '<label>' + match.tie_ratio + '</label>' +
    '<label>' + match.betOn + '</label>' +
    '<input type="hidden" name="completeBet[select' + betIds.length + ']" value="' + match.betOnValue + '"/>' +
    '<label>' + match.name + '</label></div>'
  )
}

function removeMatch(index, matchId) {
  betIds.splice(index, 1);
  $('#betMatch' + matchId).remove();
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

function toggleBetRow(betId) {
  var betRow = $('#match' + betId);
  if (betRow.attr('class').includes('active')) {
    betRow.removeClass('row-active');
    betRow.find('select').prop('disabled', false);
  } else {
    betRow.addClass('row-active');
    betRow.find('select').prop('disabled', true);
  }
}

function hideBuys(){
  $('#buyContainer').hide();
  $('.user-bet-container').removeClass('full-bet-size');
  $('.user-bet-container').addClass('cart-resize');
  $('#shoppingCart').show();
}

function showBuys() {
  $('#shoppingCart').hide();
  $('.user-bet-container').addClass('full-bet-size');
  $('.user-bet-container').removeClass('cart-resize');
  setTimeout(function(){
    $('#buyContainer').show()
  }, 200);
}
