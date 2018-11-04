class PointsController < ApplicationController
  def create
    meigen = Meigen.find(create_params[:meigen_id])

    point = Point.where('user_id = ? and meigen_id = ?', current_user.id, meigen.id)

    if point.present?
      current_point = current_user.point - create_params[:value].to_i + point[0].value
      current_user.update(point: current_point)
      point.update(create_params)
    else
      Point.create(create_params)
    end
    redirect_to meigen_path(meigen.id)
  end


  def show
    @points = Point.where(user_id: current_user.id)
  end


  private

  def create_params
    params.require(:point).permit(:meigen_id, :value).merge(user_id: current_user.id)
  end

end
