# frozen_string_literal: true

require 'application_system_test_case'

class PostsTest < ApplicationSystemTestCase
  test 'presence fields for work' do
    visit new_resume_url

    fill_in 'resume_name', with: 'Resume Name'
    fill_in 'resume_contact', with: 'Contact'

    find('#education .add_fields').click
    find('#work .add_fields').click

    assert_selector '#education input', count: 2
    assert_selector '#education select', count: 6
    assert_selector '#work input', count: 1
    assert_selector '#work select', count: 6
  end
end
