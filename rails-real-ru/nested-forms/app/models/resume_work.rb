# frozen_string_literal: true

class ResumeWork < ApplicationRecord
  validates :company, presence: true
  validates :begin_date, presence: true

  # BEGIN
  # belongs_to :resume, inverse_of: :resume_work
  belongs_to :resume
  # END
end
