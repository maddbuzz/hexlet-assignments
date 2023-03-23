# frozen_string_literal: true

class Article < ApplicationRecord
  # BEGIN
  def last_reading_date
    Rails.cache.fetch("#{cache_key_with_version}/last_reading_date", expires_in: 12.hours) do
      DateTime.now
    end
  end
  # END
end
