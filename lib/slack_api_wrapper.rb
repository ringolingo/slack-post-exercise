# twitter_api_wrapper.rb
require 'httparty'
require 'awesome_print'


class SlackApiWrapper
  BASE_URL = 'https://slack.com/api/'

  # Code goes here
  def self.send_msg(message, channel, api_key: ENV['SLACK_TOKEN'])
    response = HTTParty.post(
      "#{BASE_URL}/chat.postMessage",
      body:  {
        token: api_key,
        text: message,
        channel: channel
      },
      headers: { 'Content-Type' => 'application/x-www-form-urlencoded' }
    )

    response_body = JSON.parse(response.body)

    return true if response.success? && response_body["ok"]

    raise StandardError, response_body['error']
  end

end
