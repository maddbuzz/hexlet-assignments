# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/app'

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    App.init
  end

  def test_root
    get '/'
    assert { last_response.ok? }
    assert_match(/Hello, World!/, last_response.body)
    assert_match(/dffd6021bb2bd5b0af676290809ec3a53191dd81c7f70a4b28688a362182986f/, last_response.body)
  end

  def test_about
    get '/about'

    assert { last_response.ok? }
    assert_match(/About page/, last_response.body)
    assert_match(/c10b56512c9dc446d5a5624e9c044a68eddbc9239a3994554943805a8bc38ba7/, last_response.body)
  end

  def test_not_found
    get '/asdf'

    assert { last_response.not_found? }
    assert_match(/404 Not Found/, last_response.body)
  end

  def test_admin_forbidden
    get '/admin'

    assert { last_response.forbidden? }
  end

  def test_admin_forbidden2
    get '/admin/abc'

    assert { last_response.forbidden? }
  end
end
