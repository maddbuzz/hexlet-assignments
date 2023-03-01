# frozen_string_literal: true

module Web
  class ReviewsController < Web::ApplicationController
    def index
      @reviews = Review.limit(40).order(id: :desc)
    end
  end
end
