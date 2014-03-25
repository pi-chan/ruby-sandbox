require "logger"

rack_app = Rack::Builder.new do
  use Rack::CommonLogger
  Logger.new "./rack.log"

  map "/" do
    run Proc.new { |env| [200, {"Content-Type" => "text/html"}, ["This is public page"]] }
  end

  map "/secret" do
    use Rack::Auth::Basic, "Restricted" do |u, p|
      u == "hogehoge" and p == "piyopiyo"
    end

    map "/" do
      run Proc.new {|env| [200, {"Content-Type" => "text/html"}, ["This is a secret page"]] }      
    end
  end
end

Rack::Handler::WEBrick.run rack_app, :Port => 9292


