class ErrorsController < ApplicationController
  # Для кастомного отображения ошибок
  def not_found
    render status: :not_found
  end

  def internal_server_error
    render status: :server_error
  end
end
