# frozen_string_literal: true

# BEGIN
def fizz_buzz(start, stop)
  return nil if start > stop

  (start.upto stop).to_a.map do |i|
    if (i % 15).zero?
      'FizzBuzz'
    elsif (i % 3).zero?
      'Fizz'
    elsif (i % 5).zero?
      'Buzz'
    else
      i
    end
  end.join(' ')
end
# END
