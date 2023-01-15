require 'minitest/autorun'
require 'rack/test'

class MyApp
  def call(env)
    [200, {'X-success' => true}, ["Success response"]]
  end
end

describe "MyApp" do
  include Rack::Test::Methods

  def app
    MyApp.new
  end

  it 'check response status' do
    get '/'
    assert last_response.ok?
  end

  it 'check response headers' do
    get '/'

    assert_equal last_response.headers, {'X-success' => true}
  end

  it 'check response body' do
    get '/'
    assert_equal last_response.body, "Success response"
  end
end

# ruby test.rb
# https://www.rubydoc.info/github/brynary/rack-test/master/Rack/Test/Methods
# https://devhints.io/rack-test
