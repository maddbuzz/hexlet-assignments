# frozen_string_literal: true

# BEGIN
def compare_versions(v1string, v2string)
  v1array = v1string.split('.').map(&:to_i)
  v2array = v2string.split('.').map(&:to_i)
  v1array <=> v2array
end
# END
