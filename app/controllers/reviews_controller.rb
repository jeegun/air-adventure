class ReviewsController < ApplicationController
  before_action :set_booking, only: [:create, :new]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @adventure = @booking.adventure
    @review.booking = @booking
    if @review.save
      redirect_to adventure_path(@adventure)
    else
      render :new
    end
  end


  private

  def review_params
     params.require(:review).permit(:title, :rating, :content)
  end

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

end
