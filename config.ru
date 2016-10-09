require "./my_sinatra"

require './rackmiddleware-elapsed'
require './rackmiddleware-excited'
require './rackmiddleware-bold'

use Rack::Reloader
use RackMiddlewareBold
use RackMiddlewareElapsed
use RackMiddlewareExcited

run Sinatra::Application
