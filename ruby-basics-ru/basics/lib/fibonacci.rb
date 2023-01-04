# frozen_string_literal: true

# BEGIN
def fibonacci(num)
  return nil if num.negative?
  return num if num < 2

  prev_prev = 0
  prev = 1
  current = nil
  (2..num).each do
    current = prev_prev + prev
    prev_prev = prev
    prev = current
  end
  current
end
# END
