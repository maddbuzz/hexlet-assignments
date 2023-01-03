# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/fibonacci'

class FibonacciTest < Minitest::Test
  def test_fibonacci
    assert { fibonacci(0).zero? }
    assert { fibonacci(1) == 1 }
    assert { fibonacci(2) == 1 }
    assert { fibonacci(3) == 2 }
    assert { fibonacci(5) == 5 }
    assert { fibonacci(7) == 13 }
    assert { fibonacci(10) == 55 }
    assert { fibonacci(25) == 75_025 }
  end
end
