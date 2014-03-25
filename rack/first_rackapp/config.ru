require "./sample_app"
require "./piyo_filter"
require "./path_middleware"
require "logger"

use Rack::CommonLogger
Logger.new("./rack.log")
use Rack::Reloader
use PathMiddleware
use PiyoFilter
run SampleApp.new
