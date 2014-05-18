require 'rack'
require 'json'
require_relative 'log.rb'


logs = Log::find_all

app = Proc.new do |env|
    ['200', {'Content-Type' => 'text/html'}, [logs.to_json]]
end
 
Rack::Handler::WEBrick.run app