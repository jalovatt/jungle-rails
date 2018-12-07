class ReviewsController < ApplicationController

  before_filter :logged_in?

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.create(review_params)
    @review.user = current_user

    if @review.save
      redirect_to product_path(@product)
    else
      # How do we display a warning message?
      redirect_to product_path(@product)
    end

  end

  def destroy


  end

  private

    def review_params
      params.require(:review).permit(:text, :rating, :user_id)
    end
end
