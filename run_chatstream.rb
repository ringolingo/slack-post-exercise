# run_chatstream.rb
require 'dotenv'
Dotenv.load

require_relative 'lib/slack_api_wrapper.rb'

puts "Please enter the channel name."
channel = gets.chomp

text = ""

until text == "exit" 
  puts "Type a message, enter 'exit' to quit"
  # so this does mean if they puts "exit" right here it does make them go through the rest of the loop quite a bit
  # but other than that
  # fairly satisfied with this logic
  text = gets.chomp
  worked = true
  begin 
    SlackApi.send_msg(text, channel) unless text == "exit"
  rescue SlackApi::SlackApiError => error
    worked = false
    if error.message.include?("channel_not_found")
      puts "That channel does not exit please enter another"
      channel = gets.chomp
    else
      puts "We ran into an error stating #{error.message}."
    end
  end
  if worked
    puts "Your message has been sent. \nWould you like to change the channel you are sending to?"
    answer = gets.chomp
    if answer == "yes"
      puts "Please enter the new channel name."
      channel = gets.chomp
    end
  end
end
