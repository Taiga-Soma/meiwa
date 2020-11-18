class HomesController < ApplicationController
  before_action :authenticate_user!

  def index
    @homes = Home.includes(:user).order("created_at DESC")
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
    params.require(:home).permit(:home_name, :age, :name, :tel, :email, :prefecture_id, :zone_id, :city, :address, :price, :rate, :rent, :management, images: []).merge(user_id: current_user.id)
  end
end
