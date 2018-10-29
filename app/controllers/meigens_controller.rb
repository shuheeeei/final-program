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
    redirect_to meigens_path
  end

  def show
    @meigen = Meigen.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    meigen = Meigen.find(params[:id])
    meigen.destroy if meigen.id = current_user.id
    redirect_to meigens_path
  end

  private

  def meigen_params
    params.require(:meigen).permit(:content, :scene, :image, :source).merge(user_id: current_user.id)
  end

end
