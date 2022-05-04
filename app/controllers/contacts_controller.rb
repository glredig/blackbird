class ContactsController < ApplicationController
  before_action :check_admin, only: [:index] 
  
  def index
    @contacts = Contact.all.where(responded: false).order(created_at: :desc)
  end

  def new
    @contact = Contact.new
  end

  def create
    unless contact_params[:nickname].nil?
      flash[:notice] = "Thank you for contacting the band!"
      redirect_to root_path and return
    end

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
    params.require(:contact).permit(:name, :email, :message, :nickname)
  end

  def check_admin
    unless user_signed_in?
      redirect_to root_path
    end  
  end
end