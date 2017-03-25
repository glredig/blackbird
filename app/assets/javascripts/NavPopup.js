var NavPopup = (function() {
  var visible = false,
      width_control_el,
      resolution_switch;

  function setupListeners(trigger_el, list_el) {
    $(document).on('click', function(e) {
      if (visible) {
        $(list_el).stop(true, true).fadeOut(50);
        visible = false;
      }
      else if (e.target == trigger_el ){
        // centerPopup(list_el);
        $(list_el).stop(true, true).fadeIn(50);
        visible = true;
      }
    });

    $(window).resize(function() {
      if ($(width_control_el).width() > resolution_switch) {
        visible = false;
        $(nav_list).show();
      }
      else {
        visible ? $(nav_list).show() : $(nav_list).hide();
      }
    });
  }

  function resetVisibility(list_el) {
    $(list_el).show();
  }

  function centerPopup(list_el) {
    var display_width,
        list_width;

    display_width = $(width_control_el).width();
    list_width = $(list_el).width();

    $(list_el).css({
      right: (display_width - list_width) / 2 + 'px'
    })
  }

  return {
    init: function(config) {
      width_control_el = config.width_control_el;
      resolution_switch = config.resolution_switch;

      setupListeners(config.trigger_el, config.list_el);
    }
  }
})();