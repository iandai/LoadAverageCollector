A tool to collect server load average info over a period of time, and show in line chart. 


1. Set server name in Rake file.
2. Run bundle install.
3. Run command 'whenever -w' to generate cron job and write to system cron job. 
	 Check with 'crontab -l'.



// Add support of mac notification When average load is over 0.5, send notification.
// Add support for complex rule.