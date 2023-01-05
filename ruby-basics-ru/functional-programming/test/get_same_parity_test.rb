# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/get_same_parity'

class GetSameParityTest < Minitest::Test
  def test_get_same_parity
    assert { [] == get_same_parity([]) }
    assert { [1, 1, 1, 1] == get_same_parity([1, 1, 1, 1]) }
    assert { [1, 3] == get_same_parity([1, 2, 3]) }
    assert { [2, 10, 20] == get_same_parity([2, 10, 15, 20]) }
    assert { [12_345] == get_same_parity([12_345, 32_154, 112_332]) }
  end
end
