class AdventuresController < ApplicationController

  before_action :set_adventure, only: [:show]

  def index
    if params[:query].present?
      @adventures = Adventure.global_search(params[:query]).geocoded
    else
      @adventures = Adventure.geocoded
    end
    @markers = @adventures.map do |adventure|
        {
          lat: adventure.latitude,
          lng: adventure.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { adventure: adventure })
        }
      end
  end

def show
  @booking = Booking.new

  @markers =
  [{
    lat: @adventure.latitude,
    lng: @adventure.longitude
  }]
end

def new
  @adventure = Adventure.new
end

def create
    @user = current_user # helper method that finds the user instance of the user currently logged in (not a class mathod, that is why User.current_user not needed)
    @adventure = Adventure.new(adventure_params)
    @adventure.user = @user
    if @adventure.save
      redirect_to adventure_path(@adventure)
    else
      render :new
    end
  end

  private

  def set_adventure
    @adventure = Adventure.find(params[:id])
  end

  def adventure_params
    params.require(:adventure).permit(:name, :description, :location, :price, :languages, :number_of_guests, :photo)
  end
end
