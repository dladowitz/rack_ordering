class RackMiddlewareBold
  def initialize(appl)
    @appl = appl
  end

  def call(env)
    puts "\nStarting call method of #{self}"
    puts "@app.call(env)"

    status, headers, body = @appl.call(env) # call our Sinatra app

    puts "\nResponse from @app.call:"
    puts status
    puts headers
    puts body


    puts "\nDoing middleware work"
    body_content = body[0]
    body_content.prepend "<h1>"
    body_content << "</h1>"

    body = [body_content]

    puts "Sending down the line:"
    puts status
    puts headers
    puts body


    [status, headers, body]
  end
end
