const form = document.querySelector('.signup')
const signupBtn = document.querySelector('.signup button')
console.log("linked")
signupBtn.addEventListener('click', IsEmpty)

function IsEmpty(e) {
  e.preventDefault()

  const firstname = document.querySelector('.firstname')
  const lastname = document.querySelector('.lastname')
  const birth_year = document.querySelector('.birth_year')
  const birth_month = document.querySelector('.birth_month')
  const birth_day = document.querySelector('.birth_day')
  const email = document.querySelector('.email')
  const password = document.querySelector('.password')
  var arr = [firstname, lastname, birth_day, birth_year, birth_month, email, password]
  console.log(firstname, lastname)

  for(let i = 0; i < arr.length; i++) {
    console.log(arr[i])
    if(arr[i].value === "") {
      alert(`You forgot to fill ${arr[i].className} section`)
      return
    }
  }
  form.submit()
}