# frozen_string_literal: true

require 'application_system_test_case'

class PostCommentsTest < ApplicationSystemTestCase
  setup do
    @post_comment = post_comments(:one)
  end

  test 'visiting the index' do
    visit post_comments_url
    assert_selector 'h1', text: 'Post comments'
  end

  test 'should create post comment' do
    visit post_comments_url
    click_on 'New post comment'

    fill_in 'Body', with: @post_comment.body
    fill_in 'Post', with: @post_comment.post_id
    click_on 'Create Post comment'

    assert_text 'Post comment was successfully created'
    click_on 'Back'
  end

  test 'should update Post comment' do
    visit post_comment_url(@post_comment)
    click_on 'Edit this post comment', match: :first

    fill_in 'Body', with: @post_comment.body
    fill_in 'Post', with: @post_comment.post_id
    click_on 'Update Post comment'

    assert_text 'Post comment was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Post comment' do
    visit post_comment_url(@post_comment)
    click_on 'Destroy this post comment', match: :first

    assert_text 'Post comment was successfully destroyed'
  end
end
