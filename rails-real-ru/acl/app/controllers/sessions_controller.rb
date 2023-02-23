# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: sign_in_params[:email]

    if user&.authenticate(sign_in_params[:password])
      sign_in user
      redirect_to user
    else
      redirect_to new_session_path, notice: t('.inсorrect')
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  private

  def sign_in_params
    params.require(:user).permit(:email, :password)
  end
end
