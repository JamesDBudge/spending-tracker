# config.ru
$stdout.sync = true
require "./spending_tracker.rb"
run App
