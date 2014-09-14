require 'bundler/setup'
#***********************
#normal requires after here
require 'eventmachine'
require 'em-eventsource'
require 'em-http/middleware/json_response'
require 'pry'
require 'json'

ACCESS_TOKEN = '94143b4a1dccdcdecfcc540d18a1075e86b78a38'

headers = {'Authorization' => "Bearer #{ACCESS_TOKEN}"}
#puts headers
EM.run do
    source = EventMachine::EventSource.new('https://api.spark.io/v1/devices/53ff75065075535121101687/events', {}, headers)
    #source.use EM::Middleware::JSONResponse
    source.message do |name, message|
        jsonMsg = JSON.parse(message)
        puts "new event: #{name} data: #{jsonMsg['data']}"
    end
    source.open do
        puts "opened: #{source.ready_state}"
    end
    source.error do |error|
        puts "ERROR! #{error}"
    end
    source.start # Start listening
end
