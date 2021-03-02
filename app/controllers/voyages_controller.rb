class VoyagesController < ApplicationController


def show
  @voyages = Voyage.find(params[:id])
end


end
