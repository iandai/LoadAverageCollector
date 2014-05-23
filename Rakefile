require_relative 'lib/collector.rb'
require_relative 'lib/server.rb'

require 'yaml'

config = YAML.load_file('config.yml')

task :collector do
  server = config["remote"]
  load_average_upper_limit = config["load_average_upper_limit"]
  
  Collector.run(server, load_average_upper_limit)
end


task :view do
  Server.run
end