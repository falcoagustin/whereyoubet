const menuSelections = ['#logInMenu', '#signUpMenu'];
var betIds = [];

$(document).ready(function(){
  $('#shoppingCart').click(function(e) {
    BetHandler.showBuys();
  });
  $('#chevronDown').click(function(e) {
    BetHandler.hideBuys();
  });
  $('select').click(function(e){
    e.stopPropagation();
  });
  $('.best-five-row').click(function(e){
    let betTableHandler = new BetTableHandler();
    betTableHandler.toggleBet($(this).data('id'));
  });

});

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

class BetTableHandler {
  constructor() {
    this._betValues = {
      bet_on_local: 'Local',
      bet_on_visitor: 'Visitor',
      bet_on_tie: 'Tie'
    };
    this.betHandler = new BetHandler();
  }

  buildMatchFromHtml(matchId) {
    var matchDOMContainer = $('#match' + matchId)
    var modelDOMelem = matchDOMContainer.find('div');
    var selectDOM = matchDOMContainer.find('select');

    // TODO: Find a better way to do this.
    var name = $(modelDOMelem[0]).data('name');
    var local_ratio = $(modelDOMelem[1]).data('local-ratio');
    var visitor_ratio = $(modelDOMelem[2]).data('visitor-ratio');
    var tie_ratio = $(modelDOMelem[3]).data('tie-ratio');
    var betOn = this.parseBetValue(selectDOM[0].value);

    return {
      id: matchId,
      name: name,
      local_ratio: local_ratio,
      visitor_ratio: visitor_ratio,
      tie_ratio: tie_ratio,
      betOn: betOn
    }
  }

  toggleBet(matchId) {
    var length = this.betHandler.amountOfBets();
    var matchId = matchId;
    var index = betIds.indexOf(matchId);
    if (length == 3 && index == -1) return;
    if (length == 3 && index != -1) {
      this.betHandler.removeMatch(index, matchId);
      this.toggleBetRow(matchId);
      return;
    }
    if (length < 3){
      if (index == -1) {
        var match = this.buildMatchFromHtml(matchId);
        this.betHandler.addMatch(match);
      }else {
        this.betHandler.removeMatch(index, matchId);
      }
      this.toggleBetRow(matchId);
    }
  }

  toggleBetRow(betId) {
    var betRow = $('#match' + betId);
    if (betRow.attr('class').includes('active')) {
      betRow.removeClass('row-active');
      betRow.find('select').prop('disabled', false);
    } else {
      betRow.addClass('row-active');
      betRow.find('select').prop('disabled', true);
    }
  }

  parseBetValue(value) {
    return this._betValues[value];
  }
}

class BetHandler {
  constructor() {
    this.betIds = [];
  }

  addMatch(match) {
    this.betIds.push(match.id);
    var form = $('#completeBetForm').append(
      '<div class="user-bet-row" id="betMatch'+ match.id + '">' +
      '<input type="hidden" name="completeBet[id' + betIds.length + ']" value="' + match.id + '"/>' +
      '<label>' + match.local_ratio + '</label>' +
      '<label>' + match.visitor_ratio + '</label>' +
      '<label>' + match.tie_ratio + '</label>' +
      '<label>' + match.betOn + '</label>' +
      '<label>' + match.name + '</label></div>'
    )
  }

  static hideBuys(){
    $('#buyContainer').hide();
    $('.user-bet-container').removeClass('full-bet-size');
    $('.user-bet-container').addClass('cart-resize');
    $('.cart').show();
  }

  static showBuys() {
    $('.cart').hide();
    $('.user-bet-container').addClass('full-bet-size');
    $('.user-bet-container').removeClass('cart-resize');
    setTimeout(() => $('#buyContainer').show(), 200);
  }

  removeMatch(index, matchId) {
    this.betIds.splice(index, 1);
    $('#betMatch' + matchId).remove();
  }

  amountOfBets() {
    return this.betIds.length;
  }
}
//
// const BetHandler = (function() {
//   // STATIC AND PRIVATE
//   const algo;
//   let algo;
//   function algo() {}
//   class BetHandler {
//
//   }
//
//   function create(...) {
//     return new BetHandler(...);
//   }
//
//   return {
//     create
//   }
// })();
//
// BetHandler.crete(....)
