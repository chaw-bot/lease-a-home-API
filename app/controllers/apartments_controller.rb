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
    apartment = Apartment.new(apartment_params)
    apartment.reservation_expiry_date = Date.civil(DateTime.now.year, DateTime.now.month, -1) - 1.month
    if apartment.save
      render json: { success: true, apartment: apartment }, status: :created
    else
      render json: apartment.errors, status: :unprocessable_entity
    end
  end

  def apartment_params
    params.require(:apartment).permit(:name, :image, :description, :maintenance_fee, :monthly_rent, :city,
                                      interior: [])
  end
end
