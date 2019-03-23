class ReviewsController < ApplicationController 
  before_action :check_admin, only: [:new, :edit, :create, :update, :destroy]

  def index
    @reviews = Review.all

    respond_to do |format|
      format.html
      format.json { render json: @reviews}
    end
  end

  def new
    @review = Review.new()
  end

  def create
    @review = Review.create(review_params)
    if @review.save
      flash[:success] = "Review created!"
      redirect_to reviews_path
    else
      flash[:alert] = "There was an error; review was not created."
      redirect_to new_review_path
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update 
    @review = Review.find(params[:id])
    @review.update_attributes(review_params)
    
    if @review.save
      flash[:success] = "Changes saved!"
      redirect_to reviews_path
    else
      flash[:alert] = "Changes weren't saved."
      redirect_to edit_review_path(@review)
    end
  end

  def destroy
    Review.find(params[:id]).destroy
    flash[:success] = "Review deleted."
    redirect_to reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:name, :last_name, :date, :summary, :event)
  end

  def check_admin
    unless user_signed_in?
      redirect_to root_path
    end  
  end

end