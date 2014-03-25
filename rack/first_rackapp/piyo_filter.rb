class PiyoFilter
  def initialize(app)
    @app = app
  end

  def call(env)
    res = @app.call(env)
    res[2].each do |body|
      body.gsub!(/done/, "piyopiyo")
    end
    res[1]['Content-Length'] = res[2].body.first.bytesize.to_s
    res
  end
end
