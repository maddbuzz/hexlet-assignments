require 'set'
[Array, Set, SortedSet, Range, Hash].map(&:ancestors).reduce(:&)
# [Enumerable, Object, Kernel, BasicObject]

array_by_literal_constructor = [0, 'one', 2.0]
array_by_default_constructor = Array.new([0, 'one', 2.0])

# wrap() доступен только поставке Ruby On Rails
# https://apidock.com/rails/v6.1.3.1/Array/wrap/class
array_by_wrap_constructor = Array.wrap([0, 'one', [2.0]])

array = []

array << 0
array.push('one')
array.unshift(-1)
array.concat([3.0])

array = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"]

array.each do |letter|
  p letter
end

array.each_with_index do |letter, index|
  p "Letter(#{index}): #{letter}"
end


array = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"]
array[0]
array.at(1)
array.take(2)
array.first
array.first(2)
array[array.size - 1]
array[-1]
array.last
array.last(2)
array.sample
array.fetch(100, 'Не найден')

array.pop
array.shift
array.delete('b')
array.delete_at(0)
array.delete_if { |letter| letter == 'd' }
array.reject { |letter| letter == 'e' }
array.select { |letter| letter != 'f' }

array.reverse
array.reverse!
array.sort!

array.max
array.min
array.length
array.size
array.count
array.empty?
array.any?
# https://apidock.com/ruby/Array

array_a = [1, 2, 3]
array_b = [4, 5, 6]
array_c = [2, 4, 6]

# пересечение множеств
array_a & array_b # []
array_a & array_c # [2]
# уникальные элементы двух множеств
array_a | array_b # [1, 2, 3, 4, 5, 6]
array_a | array_c # [1, 2, 3, 4, 6]

# Set
set_by_literal_constructor = Set[0, 'one', 2.0]
set_by_default_constructor = Set.new([0, 'one', 2.0])

# SortedSet
# с 3.0 версии убрано из стандартной библиотеки и для использования нужно установить гем
# https://github.com/knu/sorted_set
sorted_set_by_literal_constructor = SortedSet[0, 'one', 2.0]
sorted_set_by_default_constructor = SortedSet.new([0, 'one', 2.0])

# spaceship operator
1 <=> 2 # -1
2 <=> 2 # 0
3 <=> 2 # 1
'a' <=> 2 # nil

array = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"]

array *= 2 # ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j"]

set = Set.new(array) # #<Set: {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j"}>


subset = Set.new(['a', 'b', 'c'])
subset.subset? set

set.difference subset # #<Set: {"d", "e", "f", "g", "h", "i", "j"}>
subset.difference set # #<Set: {}>

set.intersect? subset # true
set.disjoint? subset # false
set.subtract subset # #<Set: {"d", "e", "f", "g", "h", "i", "j"}>

set.clear # #<Set: {}>
# https://apidock.com/ruby/Set

# Range
range_with_excluded_end = 0...2
range_with_excluded_end.cover?(2) # => false

range_with_included_end = 0..2
range_with_included_end.cover?(2) # => true

range_by_default_constructor = Range.new(0,2)
range_by_default_constructor.cover?(2) # => true

range = 1..10 # 1..10

# (1..10).to_a
array = range.to_a # [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
array = (-1..-5).to_a # []
array = (-5..-1).to_a # [-5, -4, -3, -2, -1]
array = ('a'..'j').to_a # ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"]
array = ('a'...'j').to_a # ["a", "b", "c", "d", "e", "f", "g", "h", "i"]

# Hash
hash_by_literal_constructor = { foo: 0, bar: 1, baz: 2 }
hash_by_default_constructor = Hash.new
hash_by_array_constructor = Hash['foo', 0, 'bar', 1, 'baz', 2]

symbol_hash = { foo: 1, baz: 2, bar: 3 }

symbol_hash["foo"] # nil

string_hash = { "foo" => 1, "baz" => 2, "bar" => 3 }

string_hash[:foo]

hash = { foo: 1, baz: 2, bar: 3, nested_hash: { lol: 4 } }

hash[:foo] # 1
hash.fetch(:foo) # 1
hash.fetch(:error) # Будет ошибка `fetch': key not found: :error (KeyError)
ash.fetch(:error, 'error') # "error"


hash.values_at(:foo, :bar) # [1, 3]
hash[:nested_hash][:lol] # 4
hash.dig(:nested_hash, :lol) # 4

array = hash.to_a # [[:foo, 1], [:baz, 2], [:bar, 3], [:nested_hash, {:lol=>4}]]
hash = array.to_h # { foo: 1, baz: 2, bar: 3, nested_hash: { lol: 4 } }

hash = { foo: 1, baz: 2, bar: 3 }
hash[:faz] = 4 # hash = { foo: 1, baz: 2, bar: 3, faz: 4 }
hash.store(:lol, 5) # hash = { foo: 1, baz: 2, bar: 3, faz: 4, lol: 5 }
hash.merge({foo: 2, kek: 6}) # { foo: 2, baz: 2, bar: 3, faz: 4, lol: 5, kek: 6 }
hash.merge!({foo: 2, kek: 6}) # hash = { foo: 2, baz: 2, bar: 3, faz: 4, lol: 5, kek: 6 }

hash = { foo: 1, baz: 2, bar: 3 }
hash.each { |key, value| puts("Key: #{key}, value: #{value}") }
hash.each_key { |key, value| puts("Key: #{key}") }
hash.each_value { |key, value| puts("Value: #{value}") }
hash.each_pair { |key, value| puts("Key: #{key}, value: #{value}") }
hash.each_with_index { |(key, value), index | puts("Pair #{index}: key: #{key}, value: #{value}") }

hash = { foo: 1, baz: 2, bar: 3 }

hash.select {|key, value| value != 1} # { baz: 2, bar: 3 }
hash.reject {|key, value| value == 1} # { baz: 2, bar: 3 }
hash.slice(:bar, :baz) # { bar: 3, baz: 2 }
array = [:baz, :bar]
# деструктуризация массива
hash.slice(*array) # { bar: 3, baz: 2 }

hash = { foo: 1, baz: 2, bar: 3 }

hash.keys # [:foo, :baz, :bar]
hash.values # [1, 2, 3]
hash.empty? # false
hash.size # 3
hash.length # 3
hash.count # 3
# https://apidock.com/ruby/Hash

# Массив с хешем
# {"a" => 0, ..., "d" => 3}

array = ('a'...'d').to_a

hash = array.each_with_object({}).with_index do |(item, object), index|
  object[item] = index
end

pp hash # => {"a"=>0, "b"=>1, "c"=>2

res = {}
hash = array.each_with_index do |item, index|
  res[item] = index
end

hash = { "1": "a", "2": "b", "3": "c" }
hash.transfrom_values(&:upcase)
