# frozen_string_literal: true

require 'test_helper'

class PostFlowTest < ActionDispatch::IntegrationTest
  test 'can see the welcome page' do
    get root_url
    assert_select 'h1', 'Home#index'
  end

  test 'can create an post' do
    get new_post_url
    assert_response :success

    params = {
      post: {
        title: Faker::Lorem.sentence,
        body: Faker::Lorem.sentence
      }
    }

    post posts_url, params: params

    post = Post.find_by params[:post]

    assert { post }
    assert_redirected_to post_url(post)

    follow_redirect!

    assert_response :success

    assert_select 'h1', params.dig(:post, :title)
  end
end
