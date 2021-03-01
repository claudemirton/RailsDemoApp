class CarsController < ApplicationController

  http_basic_authenticate_with name: "admin", password: "nimda", except: [:index, :show]
  
  def index
    @cars = Car.all
  end
  
  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end
  
  def edit
    @car = Car.find(params[:id])
  end

  def create
    @car = Car.new(article_params)

    respond_to do |format|
      if @car.save
        flash[:notice] = 'car was successfully created.'
        format.html { redirect_to(@car) }
        format.xml { render xml: @car, status: :created, location: @car }
      else
        format.html { render action: 'new' }
        format.xml { render xml: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @car = Car.find(params[:id])

      if @car.update(article_params)
        flash[:success] = "Car was successfully updated"
        redirect_to @car
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end

  def destroy
    @car = Car.find(params[:id])
    if @car.destroy
      flash[:success] = 'Car was successfully deleted.'
      redirect_to '/admin'
    else
      flash[:error] = 'Something went wrong'
      redirect_to '/admin'
    end
  end
  

  private

  def article_params
    params.require(:car).permit(:make, :model, :year, :color, :description)
  end
end
