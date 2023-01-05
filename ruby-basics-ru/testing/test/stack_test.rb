# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def test_push!
    stack = Stack.new %w[one two three]
    stack.push! 'uno'
    stack.push! 'dundo'
    stack.push! 'freedo'
    assert { stack.size == 6 }
    assert { stack.to_a == %w[one two three uno dundo freedo] }
  end

  def test_pop
    stack = Stack.new %w[one two three]
    stack.pop!
    stack.pop!
    assert { stack.size == 1 }
    assert { stack.to_a == %w[one] }
  end

  def test_clear!
    stack = Stack.new %w[one two three]
    refute { stack.empty? }
    stack.clear!
    assert { stack.empty? }
  end

  def test_empty_stack
    stack = Stack.new
    refute { stack.size.nonzero? }
    assert { stack.empty? }
    assert { stack.to_a == [] }
    assert { stack.pop!.nil? }
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
