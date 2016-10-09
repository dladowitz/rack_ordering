require 'pry'
class RackMiddlewareBold
  def initialize(appl)
    puts "\nInitializing #{self}"
    puts "Given #{appl}\n"
    @appl = appl
  end

  def call(env)
    puts "\nStarting call method of #{self}"
    puts "Calling @app.call(env) on: #{@appl}"


    status, headers, body = @appl.call(env) # call our Sinatra app

    puts "\nResponse from #{@appl}.call:"
    puts status
    puts headers
    p body


    puts "\nDoing middleware work in #{self}"
    body_content = body[0]
    body_content.prepend "<h1>"
    body_content << "</h1>"

    body = [body_content]
    headers["Content-Length"] = body[0].length.to_s

    puts "Sending down the line:"
    puts status
    puts headers
    p body


    [status, headers, body]
  end
end
