# frozen_string_literal: true

module Api
  class UsersController < Api::ApplicationController
    # BEGIN
    def index
      @users = User.all

      # # Без гема responders выглядело бы так
      # # render json: @users.as_json(only: :title)
      # respond_with @users.as_json(only: :title)
      respond_with @users.as_json
    end

    def show
      @user = User.find(params[:id])

      respond_with @user.as_json
    end
    # END
  end
end
