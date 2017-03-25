$(document).ready(ready);
$(document).on('page:load', ready);

function ready() {
  
  // Navigation show/hide
  NavPopup.init({
    width_control_el: $('#content'),
    resolution_switch: 980,
    trigger_el: $('#nav_trigger')[0],
    list_el: $('#nav_list')[0]
  });

  email_signup_listener_setup();

  //
  if ($('#slideshow').length) {
    var $slides_wrapper = $('#slideshow'),
        url = $slides_wrapper.attr('data-url');

    SlideShow.init({
      wrapper: ($slides_wrapper)[0],
      url: url
    })
  }

  if ($('#calendar').length) {
    arc_calendar.init({
      container: $('#calendar')[0],
      url: $('#calendar').attr('data-url'),
      event_types: ['Public', 'Private', 'Unavailable', 'Available']
    })
  }

  if ($('#review_widget').length) {
    QuoteWidget.init({
      element: $('#review_widget')[0]
    })
  }
}