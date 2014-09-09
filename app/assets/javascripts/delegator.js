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
}