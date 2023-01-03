# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/fizz_buzz'

class FizzBuzzTest < Minitest::Test
  def test_fizz_buzz
    assert { fizz_buzz(1, 0).nil? }
    assert { fizz_buzz(7, 7) == '7' }
    assert { fizz_buzz(1, 5) == '1 2 Fizz 4 Buzz' }
    assert { fizz_buzz(11, 20) == '11 Fizz 13 14 FizzBuzz 16 17 Fizz 19 Buzz' }
  end
end
