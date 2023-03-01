# frozen_string_literal: true

class Web::ReviewsController < Web::ApplicationController
  def index
    @reviews = Review.limit(40).order(id: :desc)
  end
end
