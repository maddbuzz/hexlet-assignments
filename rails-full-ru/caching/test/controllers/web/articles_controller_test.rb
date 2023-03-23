# frozen_string_literal: true

require 'test_helper'

class Web::ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:one)
  end

  test 'should get index' do
    get articles_url

    assert_response :success
    assert_match @article.title, response.body
  end

  test 'should get show' do
    get article_url(@article)

    assert_response :success
    assert_match @article.title, response.body
  end
end
