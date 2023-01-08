# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/post'

class PostTest < Minitest::Test
  def setup
    @attributes = {
      id: 1,
      title: 'Hello World',
      body: 'First post!',
      created_at: '01/03/2021',
      published: true
    }

    @expected_attributes = @attributes.merge(created_at: DateTime.parse(@attributes[:created_at]))
  end

  def test_model_contains_attributes_on_initialize
    post = Post.new(@attributes)

    assert { @expected_attributes[:id] == post.id }
    assert { @expected_attributes[:title] == post.title }
    assert { @expected_attributes[:body] == post.body }
    assert { @expected_attributes[:created_at] == post.created_at }
    assert { @expected_attributes[:published] == post.published }
    assert { @expected_attributes == post.attributes }
  end

  def test_model_contains_attributes_with_accessors
    post = Post.new

    post.id = @attributes[:id]
    post.title = @attributes[:title]
    post.body = @attributes[:body]
    post.created_at = @attributes[:created_at]
    post.published = @attributes[:published]

    assert { @expected_attributes[:id] == post.id }
    assert { @expected_attributes[:title] == post.title }
    assert { @expected_attributes[:body] == post.body }
    assert { @expected_attributes[:created_at] == post.created_at }
    assert { @expected_attributes[:published] == post.published }
    assert { @expected_attributes == post.attributes }
  end

  def test_each_model_has_its_own_attributes
    post1 = Post.new title: 'test1'
    post2 = Post.new title: 'test2'

    assert { 'test1' == post1.title }
    assert { 'test2' == post2.title }
    assert { post1.title != post2.title }
  end
end
