require 'rack'
require 'json'
require 'launchy'
require_relative 'log.rb'


class Server

  def self.run
    log = Log.new
    logs = log.find_all

    app = Proc.new do |env|
      ['200', {'Content-Type' => 'text/html'}, [logs.to_json]]
    end

    Launchy.open(Dir.pwd + "/view/chart.html")
    
    Rack::Handler::WEBrick.run app
    
  end

end