class HomesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_home, only: [:destroy, :edit, :update]
  def index
    @homes = Home.all
  end

  def new
    @home = Home.new
  end

  def create
    @home = Home.new(home_params)
    if @home.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    if current_user.id == @home.user_id
      @home.destroy
      redirect_to root_path
    end
  end

  def edit
    if user_signed_in? && current_user.id == @home.user_id
    else redirect_to root_path
    end
  end

  def update
    if @home.update(home_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def home_params
    params.require(:home).permit(:buildingname, :age, :name, :tel, :email, :prefecture_id, :zone_id, :city, :address, :price, :rate, :rent, :management, :resident_id, images: []).merge(user_id: current_user.id)
  end

  def set_home
    @home = Home.find(params[:id])
  end
end
