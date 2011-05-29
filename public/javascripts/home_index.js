var current_news_ndx = 0;
var interval_id = null;
var ticker_time = 5000;
$.idleTimer(30000);  
$(document).bind("idle.idleTimer", function(){
 // function you want to fire when the user goes idle
 $("#loading").stop();
 clearInterval(interval_id);
});
$(document).bind("active.idleTimer", function(){
 // function you want to fire when the user becomes active again
 fader();
 interval_id = setInterval('next_news()', ticker_time);
});
$(document).ready(function() {
  list_events();
  interval_id = setInterval('next_news()', ticker_time);
  fader();
});

function fader() {
  if (parseInt($("#news").attr('total')) > 1) {
   $("#loading").animate({opacity: 0}, {duration: 10})
   $("#loading").animate({opacity: 1.0}, {duration: ticker_time, complete: fader})
  }
}

function list_events() {
  $(".news_item").hover(function() {
    var current_ndx = parseInt($(".title_box.carousel:visible").attr('position'));
    var next_ndx = $(this).attr('position');
    move_news(current_ndx, next_ndx);
    $("#loading").stop();
    clearInterval(interval_id);
  }, function () {
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