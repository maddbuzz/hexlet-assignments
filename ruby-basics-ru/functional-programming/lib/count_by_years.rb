# frozen_string_literal: true

# BEGIN
def count_by_years(users)
  users
    .filter { |user| user[:gender] == 'male' }
    .map { |user| user[:birthday][0..3] }
    .each_with_object({}) do |year, males_by_year|
      males_by_year[year] ||= 0
      males_by_year[year] += 1
    end
end
# END
