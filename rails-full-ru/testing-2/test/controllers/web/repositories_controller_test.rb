# frozen_string_literal: true

require 'test_helper'

module Web
  class RepositoriesControllerTest < ActionDispatch::IntegrationTest
    # BEGIN
    setup do
      repo_full_name = 'octocat/Hello-World'
      @repo_link = "https://github.com/#{repo_full_name}"
      request_link = "https://api.github.com/repos/#{repo_full_name}"
      response_json_string = load_fixture 'files/response.json'

      # stub_request(:get, request_link)
      #   .with(
      #     headers: {
      #       'Accept' => 'application/vnd.github.v3+json',
      #       'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      #       'Content-Type' => 'application/json',
      #       'User-Agent' => 'Octokit Ruby Gem 5.6.1'
      #     }
      #   )
      #   .to_return(status: 200, body: response_json_string, headers: { content_type: 'application/json' })

      stub_request(:get, request_link).to_return status: 200, body: response_json_string,
                                                 headers: { content_type: 'application/json' }
    end

    test 'should_create' do
      post repositories_url(params: { repository: { link: @repo_link } })
      assert_response :redirect
      assert_redirected_to repositories_path
      assert_equal I18n.t('success'), flash[:notice]
    end
    # END
  end
end
