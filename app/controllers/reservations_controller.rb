class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
    @harvest_experiences = HarvestExperience.all
  end

  def create
    # ① User を作成 or 取得（← @user に変更）
    @user = User.find_or_create_by(phone_number: params[:reservation][:phone_number]) do |u|
      u.name = params[:reservation][:name]
    end

    # ② Reservation に紐付ける
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = @user.id

    # ③ 保存
    if @user.valid? && @reservation.save
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
