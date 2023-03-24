# frozen_string_literal: true

module Blog
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
  end
end
