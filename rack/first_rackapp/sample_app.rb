class SampleApp
  def call(env)
    p env
    request = Rack::Request.new(env)

    body = case request.request_method
           when 'GET'
             '<html><body><form method="POST"><input type="submit" value="POST" /></form></body></html>'
           when 'POST'
             '<html><body>Post done.</body></html>'
           end

    response = Rack::Response.new do |res|
      res.status = 200
      res['Content-Type'] = 'text/html;charset=utf-8'
      res.write body
    end

    response.finish
  end
end
