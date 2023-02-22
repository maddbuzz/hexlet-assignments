# frozen_string_literal: true

class ResumeEducation < ApplicationRecord
  validates :institution, presence: true
  validates :faculty, presence: true
  validates :begin_date, presence: true

  # BEGIN
  
  # END
end
