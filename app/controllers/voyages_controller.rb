class VoyagesController < ApplicationController

  def index
    @voyages = Voyage.all
  end

  def show
    @voyage = Voyage.find(params[:id])
  end
  
  def new
    @voyage = Voyage.new
  end

  def create 
    @voyage = Voyage.create(voyage_params)
    @voyage.save 

    redirect_to voyage_path(@voyage)
  end
  
  def edit
    @voyage = Voyage.find(params[:id])
  end

    def update
    @voyage = Voyage.find(params[:id])
    @voyage.update(voyage_params)

    redirect_to voyage_path(@voyage)
  end

  def destroy
    @voyage = Voyage.find(params[:id])
    @voyage.destroy

    # no need for app/views/voyages/destroy.html.erb
    redirect_to voyages_path
  end

  def dashboard
    @voyages = Voyage.where(user_id: current_user.id)
  end

  private

  def voyage_params
    params.require(:voyage).permit(:destination, :year, :description, :price)
  end
end
