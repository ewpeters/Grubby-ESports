var current_news_ndx = 0;
var interval_id = null;
var ticker_time = 7000;

var animating = false;
$.idleTimer(600000);  
$(document).bind("idle.idleTimer", function(){
 // function you want to fire when the user goes idle
 stop();
});
$(document).bind("active.idleTimer", function(){
 // function you want to fire when the user becomes active again
});
$(document).ready(function() {
  list_events();
  start();
});

function stop() {
  animating = false;
  $("#loading").stop();
  $("#loading").css('opacity', 1);
  animating = false;
  clearInterval(interval_id)
}

function animationFinished() {
  stop();
  $("#loading").css('opacity', 1);
  next_news();
  start();
}
function start() {
  if (!animating && parseInt($("#news").attr('total')) > 1) {
    $("#loading").css('opacity', 0);
    interval_id = setInterval('animate()');
  }
}

function animate() {
  if (!animating) {
    animating = true;
    $("#loading").css('opacity', 0);
    $("#loading").animate({opacity: 1.0}, {duration: ticker_time, complete: animationFinished});
  }
}




function list_events() {
  $(".news_item").hover(function() {
    stop();
    var current_ndx = parseInt($(".title_box.carousel:visible").attr('position'));
    var next_ndx = $(this).attr('position');
    move_news(current_ndx, next_ndx);
  }, function () {
  });
  
  $("#news").hover(function() {
    
  }, function() {
    start();
  });
}

function next_news() {
  var total = parseInt($("#news").attr('total'));
  var current_ndx = parseInt($(".title_box.carousel:visible").attr('position'));
  var next_ndx = (current_ndx+1) % (total);
  
  move_news(current_ndx, next_ndx);
  current_news_ndx = next_ndx;
}

function move_news(current_ndx, next_ndx) {
  $(".carousel[position="+current_ndx+"]").hide();
  $(".carousel[position="+next_ndx+"]").show();
  $(".news_item[position="+current_ndx+"]").removeClass('selected');
  $(".news_item[position="+next_ndx+"]").addClass('selected');
}