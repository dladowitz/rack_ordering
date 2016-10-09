class RackMiddlewareExcited
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
    new_body = body.map { |string| "Super Duper " + string }
    headers["Content-Length"] = new_body[0].length.to_s

    body = new_body
    puts "Sending down the line:"
    puts status
    puts headers
    puts body

    [status, headers, body]
  end
end
