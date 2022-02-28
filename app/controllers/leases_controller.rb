class LeasesController < ApplicationController
  before_action :set_lease, only: %i[ show update destroy ]

  # GET /leases
  def index
    @leases = Lease.all

    render json: @leases
  end

  # GET /leases/1
  def show
    render json: @lease
  end

end
