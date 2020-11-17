class HomesController < ApplicationController

  def index
    # @homes = Home.all
  end

  def new
    @home = Home.new
  end

  def create
    @home = home.new(home_params)
    if @home.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def home_params
    params.require(:home).permit(:title, :price, :description, :category_id, :status_id, :burden_id, :prefecture_id, :daystoship_id, images: []).merge(user_id: current_user.id)
  end
end
