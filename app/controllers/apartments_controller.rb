class ApartmentsController < ApplicationController
  def index
    @apartments = Apartment.all
    render json: @apartments, status: :ok
  end

  def show
    @apartment = Apartment.find(params[:id])
    if @apartment
      render json: @apartment, status: :ok
    else
      render json: @apartment.errors, status: :unprocessable_entity
    end
  end

  def create 
    apartment = Apartment.new()
    if apartment.save
      render json: {success: true}, status: :created
    else
      render json: apartment.errors, status: :unprocessable_entity
    end
  end

  def apartment_params
    params.require(:add_apartment).permit(:name, :image, :maintenance_fee, :monthly_rent, :city,
                                          :reservation_expiry_date, interior: [])
  end
end
