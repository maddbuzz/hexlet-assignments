
require 'json'

class MyMiddleware
  def initialize(app1)
    @app1 = app1
  end

  def call(env)
    status, headers, body = @app1.call(env)
    request = Rack::Request.new(env)

    body = {
      path: request.path,
      verb: request.request_method,
      ip: request.ip,
      cookies: request.cookies,
      params: request.params,
      body: JSON.parse(request.body.read)
    }

    [200, {}, [body.to_json]]
  end
end

class App
  def call(env)
  end
end

use MyMiddleware
run App.new

# rackup
# curl -x POST localhost:9292/users?sort=desc -d "{\"login\":\"admin\",\"password\":\"password\"}"
