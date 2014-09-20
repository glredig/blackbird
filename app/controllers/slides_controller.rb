class SlidesController < ApplicationController
  before_filter :check_admin, except: [:index]

  def index
    @slides = Slide.all

    respond_to do |format|
      format.html
      format.json { render json: @slides.published }
    end
  end

  def new
    @slide = Slide.new
  end

  def create
    @slide = Slide.create(slide_params)

    if @slide.save
      flash[:success] = "Slide added."
      redirect_to slides_path
    else
      flash[:alert] = "Error in saving slide."
      redirect_to new_slide_path
    end
  end

  def edit
    @slide = Slide.find(params[:id])
  end

  def update
    @slide = Slide.find(params[:id])
    @slide.update_attributes(slide_params)

    if @slide.save
      flash[:success] = "Slide updated."
      redirect_to slides_path
    else
      flash[:alert] = "Error in updating slide."
      redirect_to edit_slide_path(@slide)
    end
  end

  def destroy
    @slide = Slide.find(params[:id])

    if @slide.destroy
      flash[:success]  = "Slide deleted."
      redirect_to slides_path
    else 
      flash[:alert] = "Error in deleting slide."
      redirect_to edit_slide_path(@slide)
    end
  end

  private

  def slide_params
    params.require(:slide).permit(:summary, :caption, :label_placement, :position, :publish, :slide_image)
  end

  def check_admin
    unless user_signed_in?
      redirect_to root_path
    end  
  end
end
