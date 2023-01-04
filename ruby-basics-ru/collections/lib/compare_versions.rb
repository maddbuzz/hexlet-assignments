# frozen_string_literal: true

# BEGIN
def compare_versions(string1, string2)
  major1, minor1 = string1.split('.').map(&:to_i)
  major2, minor2 = string2.split('.').map(&:to_i)
  major1 == major2 ? minor1 <=> minor2 : major1 <=> major2
end
# END
