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
      render json: @apartment.errors, status: 404
  end

  def create
  end

  def edit
  end

  def apartment_params
    params.require(:add_apartment).permit(:name, :image, interior: [], :maintenance_fee, :monthly_rent, :city, :reservation_expiry_date )
  end
end
