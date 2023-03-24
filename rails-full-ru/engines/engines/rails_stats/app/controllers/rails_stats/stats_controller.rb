# frozen_string_literal: true

require_dependency 'rails_stats/application_controller'

module RailsStats
  class StatsController < ApplicationController
    def index
      @stats_output = `bin/rails stats`
    end
  end
end
