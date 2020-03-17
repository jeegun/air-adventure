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
    @adventure = Adventure.new(adventure_params)
  end

  private

  def set_adventure
    @adventure = Adventure.find(params[:id])
  end

  def adventure_params
    params.require(:adventure).permit(:name, :description, :location, :price, :languages, :number_of_guests)
  end
end
