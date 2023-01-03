# frozen_string_literal: true

# BEGIN
def reverse(string)
  result = ''
  string.each_char { |c| result = "#{c}#{result}" }
  result
end
# END
