#!/usr/bin/env ruby

require 'bundler/setup'
#***********************
#normal requires after here
require 'eventmachine'
require 'em-eventsource'
require 'em-http/middleware/json_response'
require 'json'
#require 'pry'

require '/home/jm/working/eventPuller/epRails/config/environment'

ACCESS_TOKEN = '94143b4a1dccdcdecfcc540d18a1075e86b78a38'

headers = {'Authorization' => "Bearer #{ACCESS_TOKEN}"}
#puts headers
EM.run do
    source = EventMachine::EventSource.new('https://api.spark.io/v1/devices/53ff75065075535121101687/events', {}, headers)
    #source.use EM::Middleware::JSONResponse
    source.message do |name, message|
        jsonMsg = JSON.parse(message)
        puts message
        #puts "event: #{name} data: #{jsonMsg['data']}"
        #insert into the DB
        coreAsRails = Core.find_or_create_by(hexid: jsonMsg['coreid'])
        wev = WibeanEventV1.new(:name => name, :data => jsonMsg['data'],
                          :ttl => jsonMsg['ttl'], :published_at => jsonMsg['published_at'],
                          :core_id => coreAsRails.id, :hexid => jsonMsg['coreid'])
        success = wev.save
        puts "wev saved: #{success}"
    end
    source.open do
        puts "opened: #{source.ready_state}"
    end
    source.error do |error|
        puts "ERROR! #{error}"
    end
    source.start # Start listening
end
