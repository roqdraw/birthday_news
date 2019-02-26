
var years = document.querySelector('#years')
var months = document.querySelector('#months')
var days = document.querySelector('#days')

var monthChange = {
  "Jan": 01, "Feb": 02, "Mar": 03, "Apr": 04, "May": 05, "Jun": 06,"Jul": 07, "Aug": 08, "Sep": 09, "Oct": 10, "Nov": 11, "Dec": 12
}

function daysInMonth(year, month) {
  return new Date(year, month, 0).getDate();
}

function makeOptions(years, months) {
    for (let i = new Date().getFullYear(); i >= 1900; i--){
      var options = document.createElement('option')
      options.textContent = i
      years.appendChild(options)
    }

    var monthValues = Object.keys(monthChange)
    //populate our months select box
    for (let j = 0; j < monthValues.length; j++){
      var options = document.createElement('option')
      options.textContent = monthValues[j]
      months.appendChild(options)
    }
};

var makeDayOptions = (e) => {
  var year = years.value
  var month = months.value
  var numberOfDays = daysInMonth(year, monthChange[month])
  days.innerHTML = ""
  for(var i = 1; i <= numberOfDays; i++) {
    var options = document.createElement('option')
    options.textContent = i
    days.appendChild(options)
  }
}

years.addEventListener("change", makeDayOptions)

months.addEventListener('change', makeDayOptions)






makeOptions(years, months)