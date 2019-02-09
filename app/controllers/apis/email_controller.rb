class Apis::EmailController < ApplicationController 
  def subscribe
    @list_id = ENV["MAILCHIMP_LIST_ID"]
    gb = Gibbon::API.new

    @result = gb.lists.subscribe({
      :id => @list_id,
      :email => {:email => params[:email][:address]}
      })

    if @result
      @js_email_success = "Thank you! An email has been to you with instructions to complete registration. Please check your spam folder."
      @js_email_error = nil
    else
      @js_email_error = "Email not added. You may already have signed up."
    end
    
    respond_to do |format|
      format.js
    end

  end
end