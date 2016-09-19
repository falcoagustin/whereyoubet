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
