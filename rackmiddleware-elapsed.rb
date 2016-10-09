class RackMiddlewareElapsed
  def initialize(appl)
    puts "\nInitializing #{self}"
    puts "Given #{appl}\n"
    @appl = appl
  end

  def call(env)
    puts "\nStarting call method of #{self}"
    puts "Calling @app.call(env) on: #{@appl}"

    start = Time.now
    # puts "Setting start time: #{start}"

    status, headers, body = @appl.call(env) # call our Sinatra app

    puts "\nResponse from #{@appl}.call:"
    puts status
    puts headers
    p body

    stop = Time.now
    puts "\nSetting stop time: #{stop}"

    puts "\nDoing middleware work in #{self}"

    puts "Response Time: #{stop - start}" # display on console
    puts "\nSending down the line:"
    puts status
    puts headers
    p body
    [status, headers, body]
  end
end
