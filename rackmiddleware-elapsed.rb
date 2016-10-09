class RackMiddlewareElapsed
  def initialize(appl)
    @appl = appl
  end

  def call(env)
    puts "\nStarting call method of #{self}"
    start = Time.now
    puts "Setting start time: #{start}"

    puts "\n@app.call(env)"
    status, headers, body = @appl.call(env) # call our Sinatra app

    puts "\nResponse from @app.call:"
    puts status
    puts headers
    puts body

    stop = Time.now
    puts "\nSetting stop time: #{stop}"

    puts "Response Time: #{stop - start}" # display on console
    puts "\nSending down the line:"
    puts status
    puts headers
    puts body
    [status, headers, body]
  end
end
