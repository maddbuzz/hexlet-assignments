# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/reverse'

class ReverseTest < Minitest::Test
  def test_reverse
    assert { 'telxeH' == reverse('Hexlet') }
    assert { '!evoL enO telxeH ' == reverse(' Hexlet One Love!') }
    assert { 'ssen-em-os-ewA' == reverse('Awe-so-me-ness') }
  end
end
