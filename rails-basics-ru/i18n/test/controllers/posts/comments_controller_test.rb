# frozen_string_literal: true

require 'test_helper'

class Posts::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = post_comments(:one)
    @post = @comment.post
    @comment_params = {
      body: Faker::Lorem.sentence
    }
  end

  test 'should create comment' do
    params = { post_comment: @comment_params }
    post post_comments_url(@post, locale: :en), params: params

    comment = @post.comments.find_by @comment_params

    assert { comment }
    assert_redirected_to post_url(@post)
  end

  test 'should show edit' do
    get edit_post_comment_url(@post, @comment, locale: :en)

    assert_response :success
  end

  test 'should update comment' do
    params = { post_comment: @comment_params }
    patch post_comment_url(@post, @comment, locale: :en), params: params

    @comment.reload

    assert { @comment.body == @comment_params[:body] }
    assert_redirected_to post_url(@post)
  end

  test 'should destroy comment' do
    delete post_comment_url(@post, @comment, locale: :en)

    assert { !Post::Comment.exists? @comment.id }

    assert_redirected_to post_url(@post)
  end
end
