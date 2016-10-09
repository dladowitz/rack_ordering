require "./my_sinatra"

require './rackmiddleware-elapsed'
require './rackmiddleware-excited'
require './rackmiddleware-bold'

use Rack::Reloader
use RackMiddlewareBold
use RackMiddlewareElapsed
use RackMiddlewareExcited

puts "\n Starting up Sinatra App!!!\n"
run Sinatra::Application
