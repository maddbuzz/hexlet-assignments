# frozen_string_literal: true

require 'minitest/autorun'

def greeting(name)
  "Hello, #{name}!"
end

class MyTest < Minitest::Test
  def setup; end

  def teardown; end

  def test_if_dummy_method_returns_true
    name = 'Bob'
    expected_greeting = 'Hello, Bob!'
    assert(greeting(name) == expected_greeting)
  end
end


class MyTest < Minitest::Test
  def test_one
    assert true
  end

  def test_two
    refute false
  end

  def test_three
    refute false
    assert false
  end

  def test_flaky
    assert [false, true].sample
  end

  def test_for_procrastinators
    skip "i'll do it later"
  end
end

### Assertions

describe "Assertions" do
  it 'should be true' do
    var = true
    assert var
  end

  it 'should be false' do
    var = false
    refute var
  end

  it 'should be equal' do
    var = 2
    assert_equal var, 2
  end

  it 'should be nil' do
    assert_nil nil
  end

  it 'should be empty' do
    assert_empty []
    assert_empty ''
    assert_empty({})
  end

  it 'matches regexp' do
    assert_match(/\w+/, "some string")
  end

  it 'should include value' do
    assert_includes(0..10, 10)
  end

  it 'should throw a symbol' do
    assert_throws :symbol do
      return :symbol
    end
  end

  it 'should be instance of' do
    assert_instance_of Array, []
  end

  it 'should be descendant of Enumerable' do
    assert_kind_of Enumerable, Array.new
    assert_kind_of Enumerable, Range.new(0, 10)
    assert_kind_of Enumerable, Hash.new
  end

  it 'should be descendant of Enumerable' do
    [Array.new, Range.new(0, 10), Hash.new].each do |instance|
      assert_kind_of Enumerable, instance
    end
  end
end

### Expectation

describe "Expection" do
  it 'should be true' do
    var = true
    _(var).must_equal true
  end

  it 'should be false' do
    var = false
    _(var).must_equal false
  end

  it 'should be equal' do
    var = 2
    _(var).must_equal 2
  end

  it 'should be nil' do
    _(nil).must_be_nil
  end

  it 'should be empty' do
    _([]).must_be_empty
    _('').must_be_empty
    _({}).must_be_empty
  end

  it 'matches regexp' do
    _("some string").must_match(/\w+/)
  end

  it 'should include value' do
    _(0..10).must_include 10
    _(0...10).wont_include 10
  end

  it 'should throw a symbol' do
    _ { return :symbol }.must_throw :symbol
  end

  it 'should not be instance of' do
    _([]).wont_be_instance_of Hash
  end

  it 'should not be descendant of Comparable' do
    [Array.new, Range.new(0, 10), Hash.new].each do |instance|
      _(instance).wont_be_kind_of(Comparable)
    end
  end
end

# ### Хуки

class MyTest < Minitest::Test

  def before_setup
    puts 'a'
  end

  def setup
    puts 'b'
  end

  def after_setup
    puts 'c'
  end

  def before_teardown
    puts 'd'
  end

  def teardown
    puts 'e'
  end

  def after_teardown
    puts 'f'
  end

  def test_assert
    assert true
  end
end

describe "My Test" do
  before do
    puts '1'
  end
  before :setup do
    puts '2'
  end

  after do
    puts '3'
  end

  it 'test' do
    assert true
  end
end

# https://github.com/ruby/power_assert
# https://docs.ruby-lang.org/en/2.1.0/MiniTest/Assertions.html
