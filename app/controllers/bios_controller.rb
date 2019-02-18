class BiosController < ApplicationController
  before_filter :check_admin, only: [:new, :edit, :create, :update, :destroy] 
  
  def index
    @bios = Bio.all
  end

  def new
    @bio = Bio.new
  end

  def create
    @bio = Bio.create(bio_params)

    if @bio.save
      flash[:success] = "Bio added."
      redirect_to bios_path
    else
      flash[:alert] = "Error in saving bio."
      redirect_to new_bio_path
    end
  end

  def edit
    @bio = Bio.find(params[:id])
  end

  def update
    @bio = Bio.find(params[:id])
    @bio.update_attributes(bio_params)

    if @bio.save
      flash[:success] = "Bio updated."
      redirect_to bios_path
    else
      flash[:alert] = "Error in updating bio."
      redirect_to edit_bio_path(@bio)
    end
  end

  def destroy
    @bio = Bio.find(params[:id])

    if @bio.destroy
      flash[:success]  = "Bio deleted."
      redirect_to bios_path
    else 
      flash[:alert] = "Error in deleting bio."
      redirect_to edit_bio_path(@bio)
    end
  end

  private

  def bio_params
    params.require(:bio).permit(:name, :instruments, :summary, :bio_image, :position)
  end

  def check_admin
    unless user_signed_in?
      redirect_to root_path
    end  
  end
end