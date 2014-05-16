class Check
  require_relative 'notification.rb'
  require_relative 'log.rb'
  
  def self.get_load_average(server)
    la_info = %x[ssh #{server} 'w | head -n1']
  end
  
  def self.parse_load_average(la_info)    
    la = / (\d{1,2}:\d{2}:\d{2}) up \d{0,7} days,\s*\d{1,2}:\d{2},\s\d{0,4} users,\s*load average:\s(\d.\d{2}),\s(\d.\d{2}),\s(\d.\d{2})/.match(la_info)
    { time: la[1], la1min: la[2], la5min: la[3], la15min: la[4] }
  end
  
  def self.run(server)
    la_info = self.get_load_average(server)
    la_result = self.parse_load_average(la_info)
    Log::insert(la_result)
    puts Log::find_all
    output = " Average Load at #{la_result[:time]} is: #{la_result[:la1min]}"
    puts output
    Notification.send(output) if la_result[:la1min].to_f/la_result[:la5min].to_f > 2
  end
end