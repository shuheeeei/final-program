class LikesController < ApplicationController

  def create
    @like = current_user.likes.create(meigen_id: params[:meigen_id])
  end

  def destroy
    @like = current_user.likes.find_by(meigen_id: params[:meigen_id])
    @meigen = @like.meigen
    @like.destroy
  end

  def show
    likes = Like.where(user_id: current_user.id).order("created_at DESC")
    @meigens = []
    likes.each do |like|
      @meigens << like.meigen
    end
  end

end
