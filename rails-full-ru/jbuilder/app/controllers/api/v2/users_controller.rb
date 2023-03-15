# frozen_string_literal: true

class Api::V2::UsersController < Api::ApplicationController
  # BEGIN
  def index
    @users = User.all
    render json: @users #, each_serializer: UserSerializer
  end

  def show
    @user = User.find params[:id]
    render json: @user #, serializer: UserSerializer
  end
  # END
end
