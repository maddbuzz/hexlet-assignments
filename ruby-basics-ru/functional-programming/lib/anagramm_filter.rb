# frozen_string_literal: true

# BEGIN
def anagramm_filter(word, words)
  get_sorted_chars = ->(string) { string.chars.sort }
  word_sorted_chars = get_sorted_chars.call(word)
  words.filter do |w|
    get_sorted_chars.call(w) == word_sorted_chars
  end
end
# END
