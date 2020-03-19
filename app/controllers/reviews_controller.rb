class ReviewsController < ApplicationController
  before_action :set_booking, only: [:create, :new]

  def create
    @review = Review.new(review_params)
    @review.booking = @booking
    if @review.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def new
    @review = Review.new
  end

  private

  def review_params
     params.require(:review).permit(:title, :rating, :content)
  end

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

end
