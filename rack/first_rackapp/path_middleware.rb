class PathMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    if env['PATH_INFO'] == '/hello'
      [200, {'Content-Type' => 'text/plain'}, ["Hello middleware!"]]
    else
      @app.call(env)
    end
  end
end
