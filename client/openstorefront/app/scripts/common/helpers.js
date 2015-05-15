'use strict';
(function (window) {

  // attach myLibrary as a property of window
  var utils = window.utils || (window.utils = {});

  // BEGIN API


  utils.handleFileQueue = function(uploader, elem){
    console.log('uploader', uploader);
    console.log('elem', elem);
    
    if (uploader.queueLimit === 1){
      if (uploader.queue.length >= 1) {
        console.log('replacing the queue', elem.files);
        uploader.clearQueue();
        setTimeout(function(){
          uploader.addToQueue(elem.files);
        },0)
      } else {
        console.log('just adding it to the queue', elem.files);
        
        uploader.addToQueue(elem.files);
      }
    }
  }

  utils.getMediaHtml = function(media){
    if (media && media.mimeType){
      var type = media.mimeType;
      if (type.match('video.*')) {
        if (media.componentMediaId){
          var result = ['<button type="button" class="btn btn-sm btn-default" dynamic-popover container="body" title="" content-string="',
          '<videogular> <vg-media vg-src=\'Media.action?LoadMedia&amp;mediaId=',media.componentMediaId,'\' vg-preload=\'\\\'none\\\'\' vg-native-controls=\'true\'></vg-media></videogular>',
          '" placement="top" trigger="click"><i class="fa fa-lg fa-file-video-o"></i></button>'
          ].join('');
          return result;
        }
        return '<i class="fa fa-file-video-o"></i>'
      } else if (type.match('audio.*')){
        if (media.componentMediaId){
          var result = ['<button type="button" class="btn btn-sm btn-default" dynamic-popover container="body" title="" content-string="',
          '<audio controls><source src=\'Media.action?LoadMedia&amp;mediaId=',media.componentMediaId,'\' type=\'audio/ogg\'><source src=\'Media.action?LoadMedia&amp;mediaId=',media.componentMediaId,'\' type=\'audio/mpeg\'></audio>',
          '" placement="top" trigger="click"><i class="fa fa-lg fa-file-audio-o"></i></button>'
          ].join('');
          return result;
        }
        return '<i class="fa fa-file-audio-o"></i>'
      } else if (type.match('application.*')){
        return '<i class="fa fa-file-code-o"></i>'
      } else if (type.match('text.*')){
        return '<i class="fa fa-file-text-o"></i>'
      } else if (type.match('image.*')){
        if (media.componentMediaId){
          var result = ['<button type="button" class="btn btn-sm btn-default" dynamic-popover container="body" title="" content-string="',
          '<img class=\'thumb\' src=\'Media.action?LoadMedia&amp;mediaId=',media.componentMediaId,'\' title=\'', escape(media.fileName), '\' width=\'230\'    height=\'270\'/>',
          '" placement="top" trigger="click"><i class="fa fa-lg fa-file-image-o"></i></button>'
          ].join('');
          return result;
        }
        return '<i class="fa fa-file-image-o"></i>'
      } else {
        return '<i class="fa fa-file-o"></i>'
      }
    } else {
      return 'Missing Mime type, we cannot determine how to provide a preview.'
    }
  }

  _.mixin({
    shallowDiff: function(a,b) {
      return _.omit(a, function(v,k) { return b[k] === v; })
    },
    diff: function(a,b) {
      // console.log('a', a);
      // console.log('b', b);
      
      var r = {};
      _.each(a, function(v,k) {
        if(b && b[k] === v) return;
          // but what if it returns an empty object? still attach?
          var temp = _.isObject(v)
          ? b? _.diff(v, b[k]) : _.diff(v, '')
          : v
          ;
          if (!angular.equals({}, temp) && temp) {
            r[k] = temp
          }
        });
      if (!angular.equals({}, r)){
        return r;
      }
      return false;
    }
  });

  // function to convert letters for the job status into human readable form
  // (might think about moving this to the server so it doesn't require a code change)
  utils.calcStatus = function(val) {
    switch(val){
      case 'C':
      return 'Complete'
      break;
      case 'E':
      return 'Error'
      break;
      case 'W':
      return 'Working'
      break;
      default:
      return 'Error'
      break;
    }
  }

  utils.getStatus = function(val){
    switch(val){
      case 'DONE':
      return 'success';
      break;
      case 'CANCELLED':
      return 'warning';
      break;
      case 'FAILED':
      return 'danger';
      break;
      case 'QUEUED':
      return 'warning';
      break;
      case 'WORKING':
      return 'info';
      break;
      default:
      return 'default';
      break;
    }
  }

  utils.getIntent = function(intent){
    if (intent && intent.highlightStyle){
      return intent.highlightStyle;
    } else if(intent && intent.code){
      switch(intent.code){
        case 'COMPLETE':
        return 'success';
        break;
        case 'PEND':
        return 'warning';
        break;
        case 'SUSPENDED':
        return 'danger';
        break;
        case 'INPROG':
        return 'info';
        break;
        case 'NOEVAL':
        default:
        return 'default';
        break;
      }
    } else {
      return 'default';
    }
  }

  // function to convert the eval status code to a string. 
  // (might think about moving this to the server so it doesn't require a code change)
  utils.calcEvalStatus = function(statusCode, actual, estimated){
    switch(statusCode){
      case 'C':
      if (actual && actual !== 'null') {
        result = 'COMPLETED ' + actual;
      } else {
        result = 'COMPLETED';
      }
      break;
      case 'H':
      result = 'HALTED ' + actual;
      if (actual && actual !== 'null') {
        result = 'HALTED ' + actual;
      } else {
        result = 'HALTED';
      }
      break;
      case 'P':
      if (estimated && estimated !== 'null') {
        // result = 'IN PROGRESS (estimated complete ' + estimated + ')';
        result = 'IN PROGRESS';
      } else {
        result = 'IN PROGRESS';
      }
      break;
      default:
      if (estimated && estimated !== 'null') {
        // result = 'NOT STARTED (estimated complete ' + estimated + ')';
        result = 'NOT STARTED';
      } else {
        result = 'NOT STARTED';
      }
      break;
    }
    return result;
  }

  // converts a string into a Date object and then into a readable string.
  utils.getDate = function(date, monthYear){
    if (date)
    {
      var d = new Date(date);
      var currDate = d.getDate();
      var currMonth = d.getMonth();
      var currYear = d.getFullYear();
      if (!monthYear) {
        return ((currMonth + 1) + '/' + currDate + '/' + currYear);
      } else {
        return ((currMonth + 1) + '/' + currYear);
      }
    }
    return null;
  };

  // function to convert an object with parameters that translate to strings
  utils.toParamString = function(obj){
    var queryParams = "";
    for (var key in obj) {
      if (obj.hasOwnProperty(key)) {
        var val = obj[key];
        // if the value is a clean string and has a value, we know we want it.
        if (val !== null && (typeof val === 'string' || typeof val === 'number' || typeof val === 'boolean')){
          if (!queryParams.length) {
            queryParams += key + '=' + encodeURIComponent(val);
          } else{
            queryParams += '&' + key + '=' + encodeURIComponent(val);
          }
        }
      }
    }
    return queryParams;
  }

  // END API
  utils.RE = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

  utils.EMAIL_REGEXP = /^[a-z0-9!#$%&'*+\/=?^_`{|}~.-]+@[a-z0-9]([a-z0-9-]*[a-z0-9])?(\.[a-z0-9]([a-z0-9-]*[a-z0-9])?)*$/i;

  utils.URL_REGEX = new RegExp(
    //an empty string
    "^$|" +
    // OR
    "^" +
    // protocol identifier
    "(?:(?:https?|ftp)://)" +
    // user:pass authentication
    "(?:\\S+(?::\\S*)?@)?" +
    "(?:" +
      // IP address exclusion
      // private & local networks
      "(?!(?:10|127)(?:\\.\\d{1,3}){3})" +
      "(?!(?:169\\.254|192\\.168)(?:\\.\\d{1,3}){2})" +
      "(?!172\\.(?:1[6-9]|2\\d|3[0-1])(?:\\.\\d{1,3}){2})" +
      // IP address dotted notation octets
      // excludes loopback network 0.0.0.0
      // excludes reserved space >= 224.0.0.0
      // excludes network & broacast addresses
      // (first & last IP address of each class)
      "(?:[1-9]\\d?|1\\d\\d|2[01]\\d|22[0-3])" +
      "(?:\\.(?:1?\\d{1,2}|2[0-4]\\d|25[0-5])){2}" +
      "(?:\\.(?:[1-9]\\d?|1\\d\\d|2[0-4]\\d|25[0-4]))" +
      "|" +
      // host name
      "(?:(?:[a-z\\u00a1-\\uffff0-9]-*)*[a-z\\u00a1-\\uffff0-9]+)" +
      // domain name
      "(?:\\.(?:[a-z\\u00a1-\\uffff0-9]-*)*[a-z\\u00a1-\\uffff0-9]+)*" +
      // TLD identifier
      "(?:\\.(?:[a-z\\u00a1-\\uffff]{2,}))" +
      ")" +
    // port number
    "(?::\\d{2,5})?" +
    // resource path
    "(?:/\\S*)?" +
    "$", "i"
    );
  //
  utils.MONTHS = new Array('January', 'February', 'March',
    'April', 'May', 'June', 'July', 'August', 'September',
    'October', 'November', 'December');

  utils.queryFilter = {
    start: null,
    end: null,
    status: null,
    max: null,
    sortField: null,
    sortOrder: null,
    offset: null,
    all: false,    
    toQuery: function () {
      return utils.toParamString(this);
    }
  };
  
  utils.isNumberKey = function(evt, allowDecimal, value) {  
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (allowDecimal) {
      if (charCode === 46 && value && value.indexOf('.') === -1) {
        return true;
      }
    }
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
      return false;
    }

    return true;    
  };

  utils.errorObj = {
    errors:{
      entry: []
    },
    success: false,
    add: function(key, value){
      this.errors.entry.push({'key': key, 'value':value});
    }
  };

  utils.openWindow  = function(url, name, args, popupWin, errorBody) {

    if (typeof(popupWin) != "object"){
      popupWin = window.open(url,name,args);
    } else {
      if (!popupWin.closed){ 
        popupWin.close();
        popupWin = window.open(url, name,args);
      } else {
        popupWin = window.open(url, name,args);
      }
    }
    if (!popupWin) {
      popupWin = false;
      errorBody = errorBody || 'body';
      triggerAlert('A popup blocker is stopping this site from opening a new window.<br><br>To allow the site to open the new window, please turn off popublockers or add this site as an exception.', 'popupblocker', errorBody, 10000)
    } else {
      popupWin.focus();
    }
    return popupWin;
  }

})(window);