# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)

    @attrs = {
      title: Faker::Movies::PrincessBride.character,
      body: Faker::Movies::PrincessBride.quote
    }
  end

  test 'should get index' do
    get posts_url
    assert_response :success
  end

  test 'should get new' do
    get new_post_url
    assert_response :success
  end

  test 'should create post' do
    post posts_url, params: { post: @attrs }

    post = Post.find_by @attrs

    assert { post }
    assert_redirected_to post_url(post)
  end

  test 'should show post' do
    get post_url(@post)
    assert_response :success
  end

  test 'should get edit' do
    get edit_post_url(@post)
    assert_response :success
  end

  test 'should update post' do
    patch post_url(@post), params: { post: @attrs }

    @post.reload

    assert { @post.title == @attrs[:title] }
    assert_redirected_to post_url(@post)
  end

  test 'should destroy post' do
    delete post_url(@post)

    assert { !Post.exists? @post.id }

    assert_redirected_to posts_url
  end
end
