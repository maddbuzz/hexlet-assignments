class MyApp
  def call(env)
    [200, {'Content-Type' => 'text/html'}, ["Hello"]]
  end
end

run MyApp.new

# rackup
# rackup -s thin
# thin start
# puma
# unicorn
# passenger start
