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

  # POST /leases
  def create
    @lease = Lease.new(lease_params)

    if @lease.save
      render json: @lease, status: :created, location: @lease
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

end
