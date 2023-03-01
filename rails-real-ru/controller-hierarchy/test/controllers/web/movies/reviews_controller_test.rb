# frozen_string_literal: true

require 'test_helper'

class Web::Movies::ReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movie = movies :lord_of_the_rings
    @review = reviews :one
    @review_params = {
      body: Faker::Lorem.sentence
    }
  end

  test 'should get index' do
    get movie_reviews_url(@movie)
    assert_response :success
  end

  test 'should get new' do
    get new_movie_review_url(@movie)
    assert_response :success
  end

  test 'should get edit' do
    get edit_movie_review_url(@movie, @review)
    assert_response :success
  end

  test 'should create' do
    post movie_reviews_url(@movie), params: { review: @review_params }

    review = Review.find_by @review_params

    assert { review }
    assert_redirected_to movie_reviews_url(@movie)
  end

  test 'should update' do
    patch movie_review_url(@movie, @review), params: { review: @review_params }

    @review.reload

    assert { @review_params[:body] == @review.body }
    assert_redirected_to movie_reviews_url(@movie)
  end

  test 'should destroy' do
    delete movie_review_url(@movie, @review)

    assert { !Review.exists? @review.id }

    assert_redirected_to movie_reviews_url(@movie)
  end
end
