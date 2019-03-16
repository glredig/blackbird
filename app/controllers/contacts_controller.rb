class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    
    respond_to do |format|
      format.html do
        if @contact.save
          ContactMailer.contact_email(params[:contact][:name], params[:contact][:email], params[:contact][:message]).deliver_now!
          flash[:notice] = "Thank you for contacting the band!"
          redirect_to root_path
        end
      end
    end
  end
end