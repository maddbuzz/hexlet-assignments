# frozen_string_literal: true

module RailsStats
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
  end
end
