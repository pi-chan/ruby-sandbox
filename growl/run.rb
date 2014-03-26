#!/usr/bin/env ruby

require "ruby-growl"

texts = [
  "hogehogehogehoge",
  "fugafugafugafuga",
  "piyopiyopiyopiyo"
]

growl = Growl.new "localhost", "MyApp"
growl.add_notification(
  "notification_name", "hoghoge"
)
growl.notify "notification_name", "Notification", "#{texts.sample}"

# system "growlnotify -n 'MyApp' -t 'Notification' -m '#{texts.sample}'"

