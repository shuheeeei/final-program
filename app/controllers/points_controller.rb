class PointsController < ApplicationController
  def create
    #表示中の名言の情報を取得
    meigen = Meigen.find(create_params[:meigen_id])

    # ログインユーザーが対象の投稿にポイントを振っていないか確認(配列取得)
    point = Point.where('user_id = ? and meigen_id = ?', current_user.id, meigen.id)

    if point.present? # ポイントを振っていた場合
      # 現在のポイントを取得する
      # 送った後のポイント = 現在のポイント - 送ったポイント + すでに振っているポイント
      current_point = current_user.point - create_params[:value].to_i + point[0].value

      current_user.update(point: current_point)
      point.update(create_params)
    else # ポイントを振っていない場合
      current_point = current_user.point - create_params[:value].to_i
      Point.create(create_params)
      current_user.update(point: current_point)
    end
    redirect_to meigen_path(meigen.id)
  end


  def show
    @points = Point.where(user_id: current_user.id).page(params[:page]).per(10).order("created_at DESC")
    @meigens = []
    @points.each do |point|
      @meigens << point.meigen
    end
  end


  private

  def create_params
    params.require(:point).permit(:meigen_id, :value).merge(user_id: current_user.id)
  end

end
