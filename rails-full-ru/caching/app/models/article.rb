# frozen_string_literal: true

class Article < ApplicationRecord
  # BEGIN
  attr_writer :last_reading_date

  def last_reading_date
    @last_reading_date ||= updated_at
  end
  # END
end
