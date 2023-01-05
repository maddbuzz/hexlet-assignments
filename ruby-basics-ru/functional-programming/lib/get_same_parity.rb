# frozen_string_literal: true

# BEGIN
def get_same_parity(elements)
  return [] if elements.empty?

  first_even = elements.first.even?
  elements.filter { |e| e.even? == first_even }
end
# END
