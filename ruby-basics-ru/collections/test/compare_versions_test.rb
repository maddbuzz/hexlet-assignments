# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/compare_versions'

class CompareVersionsTest < Minitest::Test
  def test_compare_versions
    assert { compare_versions('0.2', '0.1') == 1 }
    assert { compare_versions('0.1', '0.2') == -1 }
    assert { compare_versions('4.2', '4.2').zero? }
    assert { compare_versions('0.2', '0.12') == -1 }
    assert { compare_versions('3.2', '4.12') == -1 }
    assert { compare_versions('3.2', '2.12') == 1 }
  end
end
