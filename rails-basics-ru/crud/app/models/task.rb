# frozen_string_literal: true

# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  completed   :boolean
#  creator     :string
#  description :string
#  name        :string
#  performer   :string
#  status      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

# name - обязательное, строка. Название задачи
# creator - обязательно, строка. Создатель задачи
# status - обязательное, строка. По умолчанию задача создается в новом статусе
# completed - обязательное булево значение
# description - необязательное. Описание задачи
# performer - необязательное, строка. Тот на кого поставлена задача

class Task < ApplicationRecord
  validates :name, presence: true
  validates :status, presence: true
  validates :creator, presence: true
  validates_length_of :creator, maximum: 32, message: "less than 32 if you don't mind"
  validates_length_of :performer, maximum: 32, message: "less than 32 if you don't mind"
  # validates :completed, presence: true
  validates :completed, inclusion: { in: [true, false] }
end
