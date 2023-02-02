# frozen_string_literal: true

require 'test_helper'

class EnTranslationTest < ActionDispatch::IntegrationTest
  def setup
    @post = posts :without_comments
    @locale = :en

    @post_attrs = {
      title: Faker::Movies::Ghostbusters.character,
      body: Faker::Movies::Ghostbusters.quote
    }

    @post_comment_attrs = {
      body: Faker::Movies::Lebowski.quote
    }
  end

  test 'home#index' do
    get root_path(locale: @locale)

    assert_select 'h2', text: 'Home page'
    assert_select 'ul.nav', text: /Home/
    assert_select 'ul.nav', text: /Posts/
    assert_select 'footer', text: /Hexlet/
  end

  test 'posts#index' do
    get posts_path(locale: @locale)

    assert_select 'h2', text: 'Posts'
    assert_select '#new-post-link', text: 'New Post'
  end

  test 'posts#new' do
    get new_post_path(locale: @locale)

    assert_select 'h2', text: 'New Post'
    assert_select '.new_post>.btn-success[value=?]', 'Create Post'
    assert_select '.new_post #post_title[placeholder=?]', 'Enter post title'
  end

  test 'posts#create check validation' do
    post posts_url(locale: @locale), params: { post: { title: nil } }

    assert_response :unprocessable_entity

    assert_select '.alert-danger', 'Please check the problems:'
  end

  test 'posts#create successfully' do
    post posts_url(locale: @locale), params: { post: @post_attrs }

    follow_redirect!

    assert_select '.alert-info', 'Post was created.'
  end

  test 'posts#update' do
    patch post_url(@post, locale: @locale), params: { post: @post_attrs }

    follow_redirect!

    assert_select '.alert-info', 'Post was updated.'
  end

  test 'posts#destroy' do
    delete post_url(@post, locale: @locale)

    follow_redirect!

    assert_select '.alert-info', 'Post was destroyed.'
  end

  test 'comment#create' do
    post post_comments_url(@post, locale: @locale), params: { post_comment: @post_comment_attrs }

    follow_redirect!

    assert_select '.alert-info', 'Comment was created.'
  end

  test 'comment#update' do
    comment = post_comments(:one)
    post = comment.post

    patch post_comment_url(post, comment, locale: @locale), params: { post_comment: @post_comment_attrs }

    follow_redirect!

    assert_select '.alert-info', 'Comment was updated.'
  end
end
