$(document).ready(function () {

  var documentWidth = document.documentElement.clientWidth;
  var documentHeight = document.documentElement.clientHeight;
  var curTask = 0;
  var processed = []


  var notifyTimer = `<div class="notify-timer">
  <svg width="25" height="16" viewBox="-5 -6 18 20" xmlns="http://www.w3.org/2000/svg">
  </svg>
</div>`;


  window.addEventListener('message', function (event) {
    var item = event.data;
    if (item.runProgress === true) {
      var message = "<span>" + item.textsent + "</span>";
      var fadetimer = item.fadesent;
      var element;
      $('#colorsent' + item.colorsent).css('display', 'none');
      if (item.colorsent === "error") {
        element = $('<div id="colorsent' + item.colorsent + '" class="notification-bg" style="display:none" data-total-time="' + fadetimer + '"><i class="error-strip"> </i>' + message + notifyTimer + '</div>');
      } else if (item.colorsent === "success") {
        element = $('<div id="colorsent' + item.colorsent + '" class="notification-bg" style="display:none" data-total-time="' + fadetimer + '"><i class="success-strip"> </i>' + message + notifyTimer + '</div>');
      } else if (item.colorsent === "warning") {
        element = $('<div id="colorsent' + item.colorsent + '" class="notification-bg" style="display:none" data-total-time="' + fadetimer + '"><i class="warning-strip"> </i>' + message + notifyTimer + '</div>');
      } else {
        element = $('<div id="colorsent' + item.colorsent + '" class="notification-bg" style="display:none" data-total-time="' + fadetimer + '"><i class="info-strip"></i>' + message + notifyTimer + '</div>');
      }

      $('.notify-wrap').append(element);

      element.fadeIn(200);
      startTimer(element);
      setTimeout(function () {
        element.fadeOut(500, function () {
          element.remove();
        });
      }, fadetimer);
    }
  });


  function updateProgress(e, progress) {
    const circumference = 1 * Math.PI * 5;
    const offset = (3 - (progress / 350)) * circumference;

    var c = $(e).find('.progressCircle');
    c.attr('stroke-dashoffset', offset);
  }

  function startTimer(notification) {
    const totalTime = parseInt($(notification).attr('data-total-time'), 0);
    let remainingTime = totalTime;
    const intervalTime = 100;

    const interval = setInterval(() => {
      remainingTime -= intervalTime;

      const progress = ((totalTime - remainingTime) / totalTime) * 670;
      updateProgress(notification, 300 - progress);

      if (remainingTime <= 0) {
        clearInterval(interval);
        updateProgress(notification, 0);
      }
    }, intervalTime);
  }

});