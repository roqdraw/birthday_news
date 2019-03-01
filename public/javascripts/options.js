var years = document.querySelector("#years");
var months = document.querySelector("#months");
var days = document.querySelector("#days");

var monthChange = {
  Jan: 1,
  Feb: 2,
  Mar: 3,
  Apr: 4,
  May: 5,
  Jun: 6,
  Jul: 7,
  Aug: 8,
  Sep: 9,
  Oct: 10,
  Nov: 11,
  Dec: 12
};

function daysInMonth(year, month) {
  return new Date(year, month, 0).getDate();
}

function addYears(years) {
  for (let i = new Date().getFullYear(); i >= 1900; i--) {
    var options = document.createElement("option");
    options.textContent = i;
    years.appendChild(options);
  }
}

function addMonths(months) {
  var monthKeys = Object.keys(monthChange);
  var monthValues = Object.values(monthChange);
  for (let j = 0; j < monthKeys.length; j++) {
    var option = document.createElement("option");
    option.textContent = monthKeys[j];
    option.value = monthValues[j];
    months.appendChild(option);
  }
}

function addDays() {
  for (let e = 1; e <= 31; e++) {
    var option = document.createElement("option");
    option.textContent = e;
    days.appendChild(option);
  }
}

function makeOptions(years, months) {
  addYears(years);
  addMonths(months);

  addDays()
}

var makeDayOptions = e => {
  var year = years.value;
  var month = months.value;
  var numberOfDays = daysInMonth(year, month);
  days.innerHTML = "";
  for (var i = 1; i <= numberOfDays; i++) {
    var option = document.createElement("option");
    option.textContent = i;
    days.appendChild(option);
  }
};

years.addEventListener("change", makeDayOptions);

months.addEventListener("change", makeDayOptions);

makeOptions(years, months);
