class RenteesController < ApplicationController

  http_basic_authenticate_with name: "admin", password: "nimda", only: :destroy

  def new
    @rentee = Rentee.new
  end

  def create
    @car = Car.find(params[:car_id])
    @rentee = @car.rentees.create(rentee_params)
    if @rentee.save
      flash[:success] = 'Reservation successfully created'
      redirect_to @car
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end

  def destroy
    @car = Car.find(params[:car_id])
    @rentee = @car.rentees.find(params[:id])
    if @rentee.destroy
      flash[:success] = 'Rentee was successfully deleted.'
      redirect_to '/admin'
    else
      flash[:error] = 'Something went wrong'
      redirect_to '/admin'
    end
  end

  private

  def rentee_params
    params.require(:rentee).permit(:name, :phone, :email)
  end
end
