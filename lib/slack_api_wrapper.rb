# slack_api_wrapper.rb
require 'httparty'
require 'awesome_print'


class SlackApiWrapper
  BASE_URL = 'https://slack.com/api/'
  API_KEY = ENV['SLACK_TOKEN']

  # Code goes here
  def self.send_msg(message, channel)

    response = HTTParty.post(
      "#{BASE_URL}/chat.postMessage",
      body:  {
        token: API_KEY,
        text: message,
        channel: channel
      },
      headers: { 'Content-Type' => 'application/x-www-form-urlencoded' }
    )

    response_body = JSON.parse(response.body)

    unless response.success? && response_body["ok"]
      raise StandardError, response_body["error"] 
    end

    return true
  end
end
