var exec = require('cordova/exec');

var noop = function() {};

module.exports = {
  pickContacts: function (name, successCallback, errorCallback) {
      successCallback = successCallback || noop;
      errorCallback = errorCallback || noop;

      cordova.exec(successCallback, errorCallback, "Contactsios9", "pickContacts");
  }
};
