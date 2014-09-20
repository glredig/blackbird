$(document).ready(ready);
$(document).on('page:load', ready);

function ready() {
  
  // Navigation show/hide
  NavPopup.init({
    width_control_el: $('#content'),
    resolution_switch: 865,
    trigger_el: $('#nav_trigger')[0],
    list_el: $('#nav_list')[0]
  });

  //
  if ($('#slideshow').length) {
    var $slides_wrapper = $('#slideshow'),
        url = $slides_wrapper.attr('data-url');

    SlideShow.init({
      wrapper: ($slides_wrapper)[0],
      url: url
    })
  }
}