class ReservationsController < ApplicationController
    def new
        @reservation = Reservation.new
    end
    
    def create 
        @reservation = Reservation.new(reservation_params)
        @reservation.user_id = current_user.id
        @reservation.save 

    redirect_to mes_reservations_voyage_reservations_path(@reservation)
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
    
    private

    def reservation_params
      params.require(:reservation).permit(:statut, :user_id, :voyages_id)
    end
end
