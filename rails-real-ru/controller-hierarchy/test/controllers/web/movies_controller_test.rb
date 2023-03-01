# frozen_string_literal: true

require 'test_helper'

class Web::MoviesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movie = movies :star_wars
    @movie_params = {
      title: Faker::Lorem.sentence
    }
  end

  test 'should get index' do
    get movies_url
    assert_response :success
  end

  test 'should get show' do
    get movie_url(@movie)
    assert_response :success
  end

  test 'should get new' do
    get new_movie_url
    assert_response :success
  end

  test 'should get edit' do
    get edit_movie_url(@movie)
    assert_response :success
  end

  test 'should create' do
    post movies_url, params: { movie: @movie_params }

    movie = Movie.find_by @movie_params

    assert { movie }
    assert_redirected_to movie_url(movie)
  end

  test 'should update' do
    patch movie_url(@movie), params: { movie: @movie_params }

    @movie.reload

    assert { @movie_params[:title] == @movie.title }
    assert_redirected_to movie_url(@movie)
  end

  test 'should destroy' do
    delete movie_url(@movie)

    assert { !Movie.exists? @movie.id }

    assert_redirected_to movies_url
  end
end
