var menu = document.querySelector('.menu')
var list = document.querySelector('.menu_list')

function showMenu(e) {
  if(list.classList.contains('hidden')) {
    list.classList.remove('hidden')
  } else {
    list.classList.add('hidden')
  }
  
}


menu.addEventListener('click', showMenu)