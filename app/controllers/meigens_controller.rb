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
    redirect_to("/meigens")
  end

  def show
    @meigen = Meigen.find(params[:id])
  end

  def destroy
    meigen = Meigen.find(params[:id])
    meigen.destroy
    redirect_to("/meigens")
  end

  private

  def meigen_params
    params.require(:meigen).permit(:content, :scene, :image).merge(user_id: current_user.id)
  end

end
