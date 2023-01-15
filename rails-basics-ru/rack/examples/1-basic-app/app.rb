require 'rack'

class MyApp
  def call(env)
    [200, {'Content-Type' => 'text/html'}, ["Hello"]]
  end
end

Rack::Handler::Thin.run MyApp.new, :Port => 3000
# ruby app.rb
