require 'terminal-notifier'

class Notification
  def self.send(result)
    TerminalNotifier.notify(result, :title => 'Load Average')
  end
end






