"use strict"

//Checks for blank password or user id, or other obvious misconfigurations 
function validateattempt(userName, password)  {
  if(isEmpty(userName)){
    giveError("Please enter your email")
    return false
  }
  if(isEmpty(password)){
    giveError("Please enter your password")
    return false
  }
  // TODO do some validations, (no JS, SQL, invalid chars)
  return true;
}

function giveError(errormsg) {
  document.getElementById('error').innerHTML = errormsg;
}

function thisUrl(){
  return window.location.protocol  + "//" + window.location.host;
}

function request(url, functionOnLoad, functionOnError) {
  var xhr = new XMLHttpRequest();
  xhr.open('GET', url, true);
  xhr.onload = function() {
    if (xhr.readyState == 4 && xhr.status == 200) {
      functionOnLoad(xhr);
    } else if(xhr.readyState == 4 && xhr.status != 200) {
      functionOnError(xhr);
    }
  };
  xhr.send();
}

function loginattempt() {
  var userName = document.getElementById('username').value;
  var password = document.getElementById('password').value;

  if(!validateattempt(userName, password)) {
    // failed attempt.
    return;
  }

  // get date 30 min into the future
  var apiKeyExpirationTime = moment().add(30, 'hours').unix();

  var url = thisUrl() +
    '/apiKey/new/?email=' + encodeURIComponent(userName) +
    '&password=' + encodeURIComponent(password) +
    '&expirationTime=' + encodeURIComponent(apiKeyExpirationTime);

  request(url,
    // success function
    function(xhr) {
      var apiKey = JSON.parse(xhr.responseText);
      // store info
      Cookies.set('apiKey', apiKey);
      Cookies.set('prefs', apiKey.user.prefstring);
      // now jump to next page
      if(apiKey.user.ring == 0) {
        window.location.assign(thisUrl() + "/adminoverview.html");
      } else {
        window.location.assign(thisUrl() + "/overview.html");
      }

    },
    // failure function
    function(xhr) {
      console.log("authentication failure!");
      giveError("Your email or password doesn't match our records.");
    }
  );
}

Cookies.remove('apiKey');

window.onload = function() {
  var username = document.getElementById("username");
  var password = document.getElementById("password");

  username.addEventListener("keydown", function(event) {
    if (event.keyCode === 13) {
      event.preventDefault();
      if(isEmpty(password)){
        loginattempt();
      }
      else {
        password.focus();
      }
    }
  });

  password.addEventListener("keydown", function(event) {
    if (event.keyCode === 13) {
      event.preventDefault();
      loginattempt();
    }
  });
}
