class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy]
  before_action :set_adventure, only: [:new, :create]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @user = current_user
    @booking = Booking.new(booking_params)
    @booking.user = @user
    @booking.adventure = @adventure
    # calculate_total_price
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def destroy
  end

  private

  def set_adventure
    @adventure = Adventure.find(params[:adventure_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :nr_of_booked_guests)
  end

  def calculate_total_price
    unit_price = @adventure.price
    nr_of_days = @booking.end_date - @booking.start_date
    nr_of_booked_guests = @booking.nr_of_booked_guests
    @booking.total_price = unit_price * nr_of_days * nr_of_booked_guests
  end
end
