# frozen_string_literal: true

# BEGIN
def fizz_buzz(start, stop)
  return nil if start > stop

  (start..stop)
    .map do |i|
      if (i % 15).zero? then 'FizzBuzz'
      elsif (i % 3).zero? then 'Fizz'
      elsif (i % 5).zero? then 'Buzz'
      else
        i
      end
    end
    .join(' ')
end
# END
