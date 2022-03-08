class LeasesController < ApplicationController
  before_action :set_lease, only: %i[show update destroy]

  # GET /leases
  def index
    data = []
    User.find(params[:user_id]).leases.each do |lease|
      lease_data = { lease_details: lease, apartment_details: lease.apartment }
      data << lease_data
    end
    render json: data
  end

  # GET /leases/1
  def show
    lease = { leaseDetails: @lease, apartmentDetails: @lease.apartment }
    render json: lease
  end

  # POST /leases
  def create
    @lease = Lease.new(lease_params)

    if @lease.save
      @lease.apartment.reservation_expiry_date = @lease.to
      render json: @lease, status: :created
    else
      render json: @lease.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /leases/1
  def update
    if @lease.update(lease_params)
      render json: @lease
    else
      render json: @lease.errors, status: :unprocessable_entity
    end
  end

  # DELETE /leases/1
  def destroy
    @lease.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_lease
    @lease = Lease.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def lease_params
    params.require(:lease).permit(:from, :to, :cancelled, :user_id, :apartment_id)
  end
end
