require "sinatra"
require "./middleware"

use Middleware
use HelloMiddleware

get '/' do
  'welcome to all'
end
