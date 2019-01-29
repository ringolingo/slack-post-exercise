# slack_api_wrapper_spac.rb
require_relative 'spec_helper'

describe SlackApiWrapper do
  it "can send a valid tweet" do
    VCR.use_cassette("posts") do
      response = SlackApiWrapper.send_msg('Hey I can post messages!', ENV['CHANNEL_NAME'])
      expect(response).must_equal true
    end
  end

  it "will raise an error when given an invalid channel" do
    VCR.use_cassette("posts") do
      exception = expect {
        SlackApiWrapper.send_msg("Hey I can post messages!", "invalid-channel")
      }.must_raise StandardError

      expect(exception.message).must_equal "channel_not_found"
    end
  end
end
