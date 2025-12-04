class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
    @harvest_experiences = HarvestExperience.all
  end

  def create
    @harvest_experiences = HarvestExperience.all

    @user = User.find_or_initialize_by(phone_number: params[:reservation][:phone_number])
    @user.name = params[:reservation][:name]

    @reservation = Reservation.new(reservation_params)
    @reservation.user = @user

    if @user.save && @reservation.save
      redirect_to root_path, notice: "予約が完了しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(
      :harvest_experience_id,
      :number_of_people,
      :reserved_at
    )
  end
end
