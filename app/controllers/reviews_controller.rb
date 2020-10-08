class ReviewsController < ApplicationController
  def index
    @reviews = Reviews.all
  end

  def show
      @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.save
    @review.restaurant = @restaurant
    redirect_to restaurant_path(@restaurant)
  end

private

# Only allow a list of trusted parameters through.
def review_params
  params.require(:review).permit(:name, :address, :category)
end
