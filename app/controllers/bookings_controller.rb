class BookingsController < ApplicationController
  before_action :set_booking, only: [:show]
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id)])
  end

  def new
    @booking = Booking.new
  end

  def create
    @adventure = Adventure.find(params[adventure_id])
    @user = current_user
    @booking = Booking.new(booking_params)
    @booking.user = @user
    @booking.adventure = @adventure
    if @booking.save
      redirect_to booking_path
    else
      render :new
    end
  end

  def edit
  end

  private

  def set_booking
    @booking = Booking.find(params[:id)])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price, :number_of_booked_guests)
  end
end
