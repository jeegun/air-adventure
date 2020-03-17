class AdventuresController < ApplicationController

  before_action :set_adventure, only: [:show]

  def index
    @adventures = Adventure.all
  end

  def show
  end

  def new
    @adventure = Adventure.new
  end

  def create
    @user = User.current_user
    @adventure = Adventure.new(adventure_params)
    @adventure.user = @user
    if @adventure.save
      redirect_to adventure_path
    else
      render :new
    end
  end

  private

  def set_adventure
    @adventure = Adventure.find(params[:id])
  end

  def adventure_params
    params.require(:adventure).permit(:name, :description, :location, :price, :languages, :number_of_guests)
  end
end
