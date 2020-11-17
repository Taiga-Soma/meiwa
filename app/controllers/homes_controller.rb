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
    params.require(:home).permit(:home_name, :age_id, :name, :tel, :email, :prefecture_id, :class_id, :city_id, :address_id,  :price, :rate, :rent, :management, images: []).merge(user_id: current_user.id)
  end
end
