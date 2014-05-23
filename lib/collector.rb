class Collector
  require_relative 'notification.rb'
  require_relative 'log.rb'

  def self.get_load_average(server)
    la_info = %x[ssh #{server} 'w | head -n1']
  end
  
  def self.parse_load_average(la_info)    
    la = / (\d{1,2}:\d{2}:\d{2}) up \d{0,7} days,\s*\d{1,2}:\d{2},\s\d{0,4} users,\s*load average:\s(\d.\d{2}),\s(\d.\d{2}),\s(\d.\d{2})/.match(la_info)
    { time: la[1], la1min: la[2], la5min: la[3], la15min: la[4] }
  end
  
  def self.run(server, load_average_upper_limit)
    
    la_info = self.get_load_average(server)
    la_result = self.parse_load_average(la_info)
    
    log = Log.new
    log.insert(la_result)
    
    output = " Average Load at #{la_result[:time]} is: #{la_result[:la1min]}"  
    Notification.send(output) if la_result[:la1min].to_f > load_average_upper_limit
  end
end