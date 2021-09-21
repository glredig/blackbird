class NewsItemsController < ApplicationController
	before_action :check_admin, only: [:new, :edit, :create, :update, :destroy]
	
	def index
		@news_items = NewsItem.all
	end

	def new
		@news_item = NewsItem.new
	end

	def create
    @news_item = NewsItem.create(news_item_params)
    if @news_item.save
      flash[:success] = "News item created!"
      redirect_to news_items_path
    else
      flash[:alert] = "There was an error; news item was not created."
      redirect_to new_news_item_path
    end
  end

	def edit
		@news_item = NewsItem.find(params[:id])
	end

	def update
		@news_item = NewsItem.find(params[:id])
		@news_item.update(news_item_params)

		if @news_item.save
			flash[:success] = "Changes saved!"
      redirect_to news_items_path
    else
    	flash[:alert] = "Changes weren't saved."
      redirect_to edit_news_item_path(@news_item)
    end
  end

  protected

  def news_item_params
		params.require(:news_item).permit(:title, :content, :publish)
  end
end