# Simple Load Average Collector

A simple tool to: 
* collect server load average info over a period of time
* notify when load average is high (OSX only) 
* view load average data in line chart

## Usage

* `git clone` 
* `bundle install`
* Set server name and notification average load in config.yml.
* Run `rake colloctor` to fetch first average load. 
* Run `rake view` to view load average in a line chart. 

## Setup cron

* Run command 'whenever -w' to generate cron job and write to system cron job. 
* Check with 'crontab -l'.

## Todo

* rake view should open chart file after server is up.
* Add support for complex notification rule.

## License

The MIT License.
