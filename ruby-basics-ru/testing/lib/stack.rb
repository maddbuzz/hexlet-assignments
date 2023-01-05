# frozen_string_literal: true

class Stack
  def initialize(elements = [])
    @elements = elements
  end

  def pop!
    @elements.pop
  end

  def push!(element)
    @elements << element
  end

  def empty?
    @elements.empty?
  end

  def to_a
    @elements
  end

  def clear!
    @elements = []
  end

  def size
    @elements.size
  end
end
