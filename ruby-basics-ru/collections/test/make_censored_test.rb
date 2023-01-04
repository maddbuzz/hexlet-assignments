# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/make_censored'

class MakeCensoredTest < Minitest::Test
  def test_make_censored1
    sentence = 'When you play the game of thrones, you win or you die'
    actual = make_censored(sentence, ['die'])
    expected = 'When you play the game of thrones, you win or you $#%!'
    assert { expected == actual }
  end

  def test_make_censored2
    sentence = 'chicken chicken? chicken! chicken'
    actual = make_censored(sentence, ['chicken'])
    expected = '$#%! chicken? chicken! $#%!'
    assert { expected == actual }
  end

  def test_make_censored3
    sentence = 'chicken chicken? chicken! ? chicken'
    actual = make_censored(sentence, ['?', 'chicken'])
    expected = '$#%! chicken? chicken! $#%! $#%!'
    assert { expected == actual }
  end
end
