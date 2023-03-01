# frozen_string_literal: true

require 'test_helper'

class Web::Movies::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movie = movies :lord_of_the_rings
    @comment = comments :one
    @comment_params = {
      body: Faker::Lorem.sentence
    }
  end

  test 'should get index' do
    get movie_comments_url(@movie)
    assert_response :success
  end

  test 'should get new' do
    get new_movie_comment_url(@movie)
    assert_response :success
  end

  test 'should get edit' do
    get edit_movie_comment_url(@movie, @comment)
    assert_response :success
  end

  test 'should create' do
    post movie_comments_url(@movie), params: { comment: @comment_params }

    comment = @movie.comments.find_by @comment_params

    assert { comment }
    assert_redirected_to movie_comments_url(@movie)
  end

  test 'should update' do
    patch movie_comment_url(@movie, @comment), params: { comment: @comment_params }

    @comment.reload

    assert { @comment_params[:body] == @comment.body }
    assert_redirected_to movie_comments_url(@movie)
  end

  test 'should destroy' do
    delete movie_comment_url(@movie, @comment)

    assert { !Comment.exists? @comment.id }

    assert_redirected_to movie_comments_url(@movie)
  end
end
