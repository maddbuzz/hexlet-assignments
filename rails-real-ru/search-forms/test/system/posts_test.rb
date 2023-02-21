# frozen_string_literal: true

require 'application_system_test_case'

class PostsTest < ApplicationSystemTestCase
  test 'filter is working' do
    visit posts_url

    fill_in 'q_title_cont', with: 'Find It'

    click_on 'Search'

    found_posts = all('tbody tr')

    assert { 1 == found_posts.count }
  end
end
