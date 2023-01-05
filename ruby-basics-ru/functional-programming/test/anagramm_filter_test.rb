# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/anagramm_filter'

class AnagrammFilterTest < Minitest::Test
  def test_anagramm_filter
    assert { anagramm_filter('laser', %w[lazing lazy lacer]) == [] }
    assert { anagramm_filter('abba', %w[aabb abcd bbaa dada]) == %w[aabb bbaa] }
    assert { anagramm_filter('racer', %w[crazer carer racar caers racer]) == %w[carer racer] }
  end
end
