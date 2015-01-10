function email_signup_listener_setup() {
  $('#email_signup_form input[type=submit').on('click', function() {
    $('#email_signup_form').hide();
    $('#email_signup_spinner').show();
    $('#email_signup_message').html('').hide().removeClass('error');
  });
}