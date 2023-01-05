# frozen_string_literal: true

# BEGIN
def count_by_years(users)
  users
    .filter { |user| user[:gender] == 'male' }
    .map { |user| user[:birthday][0..3] }
    # .each_with_object(Hash.new(0)) { |year, acc| acc[year] += 1 }
    .tally
end
# END
