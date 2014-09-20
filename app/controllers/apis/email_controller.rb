class Apis::EmailController < ApplicationController 
  def subscribe
    @list_id = ENV["MAILCHIMP_LIST_ID"]
    gb = Gibbon::API.new

    result = gb.lists.subscribe({
      :id => @list_id,
      :email => {:email => params[:email][:address]}
      })

    if result
      flash[:success] = "You were added to the notification list!"
    else
      flash[:alert] = "An error occurred and you were not added to the list. Please try again."
    end
    redirect_to :root

  end
end