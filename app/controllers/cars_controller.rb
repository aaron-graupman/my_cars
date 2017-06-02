class CarsController < ApplicationController
  before_action :set_car, except: [:index, :new, :create]

  def index
    # Scope the cars down to the user that is logged in
    @cars = current_user.cars
  end

  def show
  end

  def new
    @car = current_user.cars.new
  end

  def create
    @car = current_user.cars.new(car_params)
    if @car.save
      redirect_to @car, notice: 'Car Created!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    # our before action is doing this for us
    # @car = Car.find(params[:id])
    if @car.update(car_params)
      redirect_to @car
    else
      render :edit
    end
  end

  def destroy
    # our before action is doing this for us
    # @car = Car.find(params[:id])
    @car.destroy
    redirect_to cars_path
  end

  private
    # Strong Params
    def car_params
      params.require(:car).permit(:make, :model,
                                  :color, :year,
                                  :mileage, :runs)
    end

    # Before Action
    def set_car
      @car = current_user.cars.find(params[:id])
    end
end
