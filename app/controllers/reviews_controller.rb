class ReviewsController < ApplicationController
	def new
		@restaurant = Restaurant.find(params[:restaurant_id])
		@review = Review.new
	end

	def create
		# Initialize the new review with the form data
		@review = Review.new(review_params)

		# Find the restaurant that need to be connected to the review
		@restaurant = Restaurant.find(params[:restaurant_id])
		
		# We assign the restaurant to the review
		@review.restaurant = @restaurant
		
		if @review.save
			redirect_to restaurant_path(@restaurant)
		else
			raise
			render :new
		end
	end

	def destroy
		@review = Review.find(params[:id])
		@review.destroy
		redirect_to restaurant_path(@review.restaurant)
	end

	private

	def review_params
      params.require(:review).permit(:content)
    end
end
