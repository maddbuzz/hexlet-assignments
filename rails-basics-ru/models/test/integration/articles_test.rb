# frozen_string_literal: true

require 'test_helper'

class ArticlesTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:one)
  end

  test 'visiting the index' do
    get articles_url

    assert_select 'h1', text: 'Articles'
    assert_select 'li a', @article.title

    assert_response :success
  end

  test 'visiting article page' do
    get article_url(@article)

    assert_select 'h1', @article.title
    assert_select 'p', @article.body

    assert_response :success
  end
end
