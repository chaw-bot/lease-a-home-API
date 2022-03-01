class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:id])
    render json: { user: @user }
  end
end
