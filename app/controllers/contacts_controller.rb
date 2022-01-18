class ContactsController < ApplicationController
  before_action :check_admin, only: [:index] 
  
  def index
    @contacts = Contact.all.order(:created_at)
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.create(contact_params)
    if @contact.save
      flash[:notice] = "Thank you for contacting the band!"
      redirect_to root_path
    else
      flash.now[:error] = 'Could not send message'
      render :new
    end
  end

  private
  
  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end

  def check_admin
    unless user_signed_in?
      redirect_to root_path
    end  
  end
end