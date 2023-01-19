# frozen_string_literal: true

class BulletinsController < ApplicationController
  # BEGIN
  def index
    # @bulletins = Bulletin.all.order(created_at: :desc)
    @bulletins = Bulletin.all
  end

  def show
    # debugger
    @bulletin = Bulletin.find(params[:id])
  end
  # END
end
