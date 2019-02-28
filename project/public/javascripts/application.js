const menu = document.querySelector('.menu')
const list = document.querySelector('.menu_list')
const user = document.querySelector('.user')
const userSetting = document.querySelector('.user_setting')

function showUserSetting(e) {
  if(userSetting.classList.contains('hidden')) {
    userSetting.classList.remove('hidden')
  } else {
    userSetting.classList.add('hidden')
  }
}




if(userSetting !== null) {
  user.addEventListener('click', showUserSetting)
}


