// User Name Popup
$(function(){
    // javascript: window.onload
    $("#help_btn").click(function(){
        open_popup();
    });
    $('[data-toggle="popover"]').popover();

    $('#mouse_over').hover(function() {
        $(this).css('background', '#c00');
        $('#mouse_over').popover('show');
      }, function() {  // for Else
        $(this).css('background', '');
        $('#mouse_over').popover('hide');
      });
});

function open_popup(){
    var pop_title = "HELP";// You can set those variables from arguments,
    var url = "/help";// together with height, width, top, and left.
    var location_str = 'height=600,width=800,top=10,left=10';
    window.onstorage = message_receive;
    var help_window = window.open(url, pop_title, location_str);
    help_window.focus();
    return false;
}

function message_receive(event) {
    if (event.key != 'message') return; // ignore other keys
    var message = JSON.parse(event.newValue);
    if (!message) return; // ignore empty msg or msg reset
  
    if (message.command == 'inquire') {
      window.focus();
      var inq_number = message.inq_number;
      if (inq_number == 1){
        request = new XMLHttpRequest();
        request.open('GET', '/', true);
        request.send(null);
        request.onreadystatechange = function () {
          if (request.readyState == 4) {
            var data = request.responseText;
            document.open();
            document.clear();
            document.write(data); // Update screen
            history.replaceState('', '', '/');
            document.close();
          }
        }
      }
      else if (inq_number == 2){
        $('<div>', {'text': 'New Element from HELP'}).appendTo("#messages")
      }
    }
  }
