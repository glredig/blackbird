class ContactsController < ApplicationController
  before_action :check_admin, only: [:index] 
  
  def index
    @contacts = Contact.all.where(responded: false).order(created_at: :desc)
  end

  def new
    @contact = Contact.new
  end

  def create
    # This is the bot trap
    unless contact_params[:nickname].empty?
      flash[:notice] = "Thank you for contacting the band!"
      redirect_to root_path and return
    end

    @contact = Contact.create(contact_params)
    if @contact.save
      flash[:notice] = "Thank you for contacting the band!"
      begin
        ContactMailer.with(email: contact_params[:email], name: contact_params[:name], message: contact_params[:message]).contact_email.deliver_now
        redirect_to root_path
      rescue
        redirect_to root_path
      end
    else
      flash.now[:error] = 'Could not send message'
      render :new
    end
  end

  def destroy
    @contact = Contact.find(params[:id])

    if @contact.destroy
      flash[:success]  = "Contact deleted."
      redirect_to contacts_view_all_path
    else
      flash[:alert] = "Error in deleting contact."
      redirect_to contacts_view_all_path
    end
  end

  private
  
  def contact_params
    params.require(:contact).permit(:name, :email, :message, :nickname)
  end

  def check_admin
    unless user_signed_in?
      redirect_to root_path
    end  
  end
end