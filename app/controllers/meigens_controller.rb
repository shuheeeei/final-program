class MeigensController < ApplicationController
  def index
    @meigens = Meigen.includes(:user).order("created_at DESC")
  end

  def new
    @meigen = Meigen.new
  end

  def create
    image = meigen_params[:image] if params[:meigen][:image]

    @meigen = Meigen.new(meigen_params)

    if @meigen.save
      increase_point = current_user.point + 10
      current_user.update(point: increase_point)
      redirect_to("/meigens")
    else
      render("meigens/new")
    end
  end

  def edit
    @meigen = Meigen.find(params[:id])
  end

  def update
    meigen = Meigen.find(params[:id])
    meigen.update(meigen_params) if meigen.user_id == current_user.id
    redirect_to("/meigens/#{params[:id]}")
  end

  def show
    @meigen = Meigen.find(params[:id])
    @comment = Comment.new

    @point = Point.new
    @current_status = Point.where("meigen_id = ? and user_id = ?", @meigen.id, current_user.id)
    @current_status.present? ? @current_point = @current_status[0].value : @current_point = 0

    if current_user.point == 0 && @current_status.empty?
      pull_down_menu_max = 0
    else
      pull_down_menu_max = @current_point + current_user.point

    end

    @num = []
    0.step(pull_down_menu_max, 10) do |i|
      @num << i
    end

    points = Point.includes(:user).where("meigen_id = ?", @meigen.id)
    max = points.maximum(:value)
    @max_point = points.where("value = ?", max)

  end

  def destroy
    meigen = Meigen.find(params[:id])

    meigen.points.each do |point|
      repair = point.user.point + point.value
      point.user.update(point: repair)
    end

    meigen.destroy if meigen.user_id == current_user.id
    redirect_to meigens_path
  end

  def search
    @meigens = Meigen.contents(params[:keyword])
    @source_meigens = Meigen.sources(params[:keyword])
    @tag_meigens = Meigen.joins(:tags).select("meigens.*, tags.name").tags(params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
  end


  private

  def meigen_params
    params.require(:meigen).permit(:content, :scene, :image, :source, :tag_list).merge(user_id: current_user.id)
  end

end
