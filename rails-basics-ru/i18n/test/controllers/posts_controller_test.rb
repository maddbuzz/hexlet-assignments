# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:without_comments)

    @attrs = {
      title: Faker::Movies::Ghostbusters.character,
      body: Faker::Movies::Ghostbusters.quote
    }
  end

  test 'should get index' do
    get posts_url(locale: :en)
    assert_response :success
  end

  test 'should get new' do
    get new_post_url(locale: :en)
    assert_response :success
  end

  test 'should create post' do
    post posts_url(locale: :en), params: { post: @attrs }

    post = Post.find_by @attrs

    assert { post }
    assert_redirected_to post_url(post)
  end

  test 'should show post' do
    get post_url(@post, locale: :en)
    assert_response :success
  end

  test 'should get edit' do
    get edit_post_url(@post, locale: :en)
    assert_response :success
  end

  test 'should update post' do
    patch post_url(@post, locale: :en), params: { post: @attrs }

    @post.reload

    assert { @post.title == @attrs[:title] }
    assert_redirected_to post_url(@post)
  end

  test 'should destroy post' do
    delete post_url(@post, locale: :en)

    assert { !Post.exists? @post.id }

    assert_redirected_to posts_url
  end
end
