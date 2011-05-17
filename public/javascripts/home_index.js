var current_news_ndx = 0;
var timeout_id = null;
var loading_img = null;
$(document).ready(function() {
  loading_img = $("#loading").clone();
  list_events();
  start_loading();
  setInterval('check_loading()', 5000);
});

function check_loading() {
  clearTimeout(timeout_id);
  if ($("#loading").length == 0) {
    loading_img.prependTo("#news");
    start_loading();
  } 
}
function list_events() {
  $(".news_item").hover(function() {
    stop_loading();
    var current_ndx = parseInt($(".title_box.carousel:visible").attr('position'));
    var next_ndx = $(this).attr('position');
    move_news(current_ndx, next_ndx);
  }, function () {
  });
}
function start_loading() {
  $("#loading").fadeIn(5000, next_news);
}

function stop_loading() {
  $("#loading").remove();
}
function next_news() {
  var total = parseInt($("#news").attr('total'));
  var current_ndx = parseInt($(".title_box.carousel:visible").attr('position'));
  var next_ndx = (current_ndx+1) % (total);
  
  move_news(current_ndx, next_ndx);
  current_news_ndx = next_ndx;
  $("#loading").hide();
  timeout_id = setTimeout('start_loading();', 1000)
}

function move_news(current_ndx, next_ndx) {
  $(".carousel[position="+current_ndx+"]").hide();
  $(".carousel[position="+next_ndx+"]").show();
  $(".news_item[position="+current_ndx+"]").removeClass('selected');
  $(".news_item[position="+next_ndx+"]").addClass('selected');
}