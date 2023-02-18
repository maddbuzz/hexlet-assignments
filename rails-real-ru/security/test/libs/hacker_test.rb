# frozen_string_literal: true

require 'test_helper'
require 'rake'

class HackerTest < ActiveSupport::TestCase
  def setup
    @authenticity_token = 'auth-token'
    @cookie = 'cookie-test'
    @uri = 'https://rails-collective-blog-ru.hexlet.app'
  end

  test 'test task' do
    stub_request(:get, "#{@uri}/users/sign_up")
      .to_return(
        body: "<html><input type='hidden' name='authenticity_token' value='#{@authenticity_token}'></html>",
        headers: { 'Set-Cookie': @cookie }
      )

    stub_request(:post, "#{@uri}/users")
      .with(
        body: hash_including({ authenticity_token: @authenticity_token }),
        headers: { cookie: @cookie }
      )
      .to_return(status: 302)

    response = Hacker.hack('test@test.io', 'password')

    assert response
  end
end
