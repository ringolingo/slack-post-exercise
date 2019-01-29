# run_chatstream.rb
require 'dotenv'
Dotenv.load

require_relative 'lib/slack_api_wrapper.rb'

puts "Please enter the channel name."
channel = gets.chomp

text = ""

until text == "exit" 
  puts "Type a message, enter 'exit' to quit"
  text = gets.chomp
  begin 
    SlackApiWrapper.send_msg(text, channel) unless text == "exit"
  rescue StandardError => error
    if error.message == "channel_not_found"
      puts "That channel does not exit please enter another"
      channel = gets.chomp
    else
      puts "We ran into an error stating #{error.message}."
    end
  end
end
