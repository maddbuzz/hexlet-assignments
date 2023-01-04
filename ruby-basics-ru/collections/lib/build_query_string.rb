# frozen_string_literal: true

# BEGIN
def build_query_string(params)
  params
    .sort_by { |key, _value| key }
    .map { |(key, value)| "#{key}=#{value}" }
    .join '&'
end
# END
