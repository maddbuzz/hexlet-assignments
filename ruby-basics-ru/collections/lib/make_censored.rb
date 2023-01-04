# frozen_string_literal: true

def make_censored(text, stop_words)
  # BEGIN
  text
    .split
    .map do |word|
      stop_words.include?(word) ? '$#%!' : word
    end
    .join ' '
  # END
end
