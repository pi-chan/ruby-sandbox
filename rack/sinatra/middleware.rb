class Middleware
  def initialize(app)
    @app = app
  end

  def call(env)
    start = Time.now
    response = @app.call(env)
    stop = Time.now

    puts "Response Time: #{stop-start}"
    response
  end
end

class HelloMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    if env["PATH_INFO"] == "/hello"
      [200, {'Content-Type' => 'text/plain'}, ["Hello from middleware!"]]
    else
      @app.call(env)
    end
  end
end
