# slack_api_wrapper.rb
require "httparty"

module SlackApi
  BASE_URL = "https://slack.com/api/"
  API_KEY = ENV["SLACK_TOKEN"]

  class SlackError < StandardError; end

  # Code goes here
  def self.send_msg(text, channel)
    response = HTTParty.post(
      "#{BASE_URL}chat.postMessage",
      headers: {"Content-Type" => "application/x-www-form-urlencoded"},
      body: {
        token: API_KEY,
        channel: channel,
        text: text,
      },
    )
    if response["ok"]
      return true
    else
      raise SlackApi::SlackError, "Error when posting #{text} to #{channel}, error: #{response["error"]}"
    end
  end
end
