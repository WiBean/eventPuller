require 'bundler/setup'
#***********************
#normal requires after here
require 'eventmachine'
require 'em-eventsource'
require 'em-http/middleware/json_response'

ACCESS_TOKEN = '94143b4a1dccdcdecfcc540d18a1075e86b78a38'

headers = {'Authorization' => "Bearer #{ACCESS_TOKEN}"}
EM.run do
  source = EventMachine::EventSource.new('https://api.spark.io/v1/devices/53ff75065075535121101687/events', headers)
  source.use EM::Middleware::JSONResponse
  source.message do |message|
    puts "new event: #{message.name} data: #{message.data}"
  end
  source.start # Start listening
end