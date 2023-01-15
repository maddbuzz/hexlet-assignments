
class MyMiddleware
  def initialize(app1)
    @app1 = app1
  end

  def call(env)
    puts 'middleware_before'
    status, headers, body = @app1.call(env)
    puts 'middleware_after'
    request = Rack::Request.new(env)
    if request.path == '/'
      case request.request_method
      when 'GET'
        [status, headers, body]
      when 'POST'
        [201, headers.merge({'x-created' => 'True'}), ['Item was successfully created']]
      end
    else
      [404, {}, ["Not Found"]]
    end
  end
end

class App
  def call(env)
    puts 'app_run'
    [200, {}, ["success"]]
  end
end

use MyMiddleware
run App.new
