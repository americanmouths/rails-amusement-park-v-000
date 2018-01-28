class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
    @user = current_user
  end

  def new
    @attraction = Attraction.new
  end

  def edit
    @attraction = Attraction.find_by(:id => params[:id])
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to @attraction
  end

  def show
    @attraction = Attraction.find_by(:id => params[:id])
    @user = current_user
  end

  def update
    @attraction = Attraction.find_by(:id => params[:id])
    @attraction.update(attraction_params)

    redirect_to @attraction
  end

  private
    def attraction_params
      params.require(:attraction).permit(:name, :nausea_rating, :happiness_rating, :min_height, :tickets)
    end
end
