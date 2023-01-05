# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/count_by_years'

class CountByYearsTest < Minitest::Test
  def test_count_by_years
    users = [
      { name: 'Bronn', gender: 'male', birthday: '1973-03-23' },
      { name: 'Reigar', gender: 'male', birthday: '1973-11-03' },
      { name: 'Eiegon', gender: 'male', birthday: '1963-11-03' },
      { name: 'Sansa', gender: 'female', birthday: '2012-11-03' },
      { name: 'Jon', gender: 'male', birthday: '1980-11-03' },
      { name: 'Robb', gender: 'male', birthday: '1980-05-14' },
      { name: 'Tisha', gender: 'female', birthday: '2012-11-03' },
      { name: 'Rick', gender: 'male', birthday: '2012-11-03' },
      { name: 'Joffrey', gender: 'male', birthday: '1999-11-03' },
      { name: 'Edd', gender: 'male', birthday: '1973-11-03' }
    ]

    expected = {
      '1973' => 3,
      '1963' => 1,
      '1980' => 2,
      '2012' => 1,
      '1999' => 1
    }

    assert { expected == count_by_years(users) }
  end
end
