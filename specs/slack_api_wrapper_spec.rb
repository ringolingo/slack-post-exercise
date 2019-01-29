require_relative 'spec_helper'

describe SlackApiWrapper do
  it "can send a valid tweet" do
    VCR.use_cassette("tweets") do
      response = SlackApiWrapper.send_msg('Hey I can tweet!')
      expect(response).must_equal true
    end

  end
end
