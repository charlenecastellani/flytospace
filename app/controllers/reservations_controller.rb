class ReservationsController < ApplicationController
    def new
        @reservation = Reservation.new
        @voyage = Voyage.find(params[:voyage_id])
    end
    
    def create 
        @voyage = Voyage.find(params[:voyage_id])
        @reservation = Reservation.new(statut: "en cours")
    
        @reservation.voyage = @voyage
        @reservation.user_id = current_user.id

        
        if @reservation.save
          redirect_to mes_reservations_voyage_reservations_path(@reservation)
        else
          render "voyages/index"
        end
    end

    def destroy 
      @reservation = Reservation.find(params[:id])
      @reservation.destroy

    # no need for app/views/voyages/destroy.html.erb
    redirect_to mes_reservations_voyage_reservations_path(@reservation)
    end

    def mes_reservations
        @reservations = Reservation.where(user_id: current_user.id)
    end
    
  
end
