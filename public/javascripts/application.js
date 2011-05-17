// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function isBlank(str) {
    return (!str || /^\s*$/.test(str));
}

String.prototype.trim = function() {
	return this.replace(/^\s+|\s+$/g,"");
}

function inputClear(selector) {
  var og_name = $(selector).val()
  
  $(selector).focusin(function() {
    if ($(this).val().trim() == og_name.trim()) {
      $(this).val('');
    }
  });
  
  $(selector).focusout(function() {
    if (isBlank($(this).val())) {
      $(this).val(og_name);
    }
  });
  
  return og_name;
}

$(document).ready(function() {
  $("#Article").removeAttr("checked"); 
  inputClear("#search_input");
  $("#login").focus(function() {
    $("#password_div").removeClass("hidden");
    $("#password").removeClass("hidden");
    $("#login-form").addClass("shown");
  });
  
  $('body').click(function(event) {
      if (!$(event.target).closest('#login-form').length) {
        $("#password_div").addClass("hidden");
        $("#password").addClass("hidden")
        $("#login-form").removeClass("shown");
      };
  });
  
  $('.embed_video').click(function() {
    $('.video_title').html($(this).attr('title'));
    $('.video_summary').html($(this).attr('summary'));
    $('#video_type').html($(this).attr('type'));
    $('#embed').html($(this).attr('embed_source'));
    if ($(this).attr('type') == "You Tube") {
       $('#chat').remove();
       $('#pop_up').remove();
    } else {
      $('#chat').attr('chat_code',$(this).attr('chat_code'));
      $('#pop_up').attr('chat_code', $(this).attr('chat_code'));
    }
    $('.tv_item').hide();
    $('#video_player').toggleClass('hidden');    
  });
  
  $('#fb_connect').click(function(){
    fb_connect();
  });
  
  $('.icon.warcraft').click(function(){
    $(this).toggleClass('true');
    toggleItems("warcraft_3");
  });
  $('.icon.starcraft').click(function(){
    $(this).toggleClass('true');
    toggleItems("starcraft_2");
  });
  
  $(".add_more").click(function() {
    var input = $(".pic").last().clone();
    input.children().val('');
    $(".pic").last().after(input);
  });
  
  $(".album_thumb").click(function() {
    $.ajax({
      type: "GET",
      url: "/albums/"+ $(this).attr('id') + ".js",
      success: function(data) {
        var json = jQuery.parseJSON(data);
        $(".ajax-replace").html(json.html);
      },
	  	error: function(data) {
	  	  
	  	}
    });
    return false;
  });
  
});

function toggleItems(game) {
  $("div[game="+game+"]").toggleClass('hidden');
}

function fb_connect() {
  FB.login(function(response) {
    if (response.session) {
      var loginForm = $('#fb_form');
      loginForm.find("#access_token").val(response.session.access_token);
      loginForm.find("#uid").val(response.session.uid);
      loginForm.submit();
    }
  });
}
function popitup(url) {
	newwindow=window.open(url,'name','height=500,width=500');
	if (window.focus) {newwindow.focus()}
	return false;
}