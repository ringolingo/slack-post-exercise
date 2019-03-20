# slack_api_wrapper_spac.rb
require_relative "spec_helper"

describe SlackApi do
  describe "send_msg" do
    it "can send a valid message" do
      VCR.use_cassette("slack_message") do
        return_value = SlackApi.send_msg("Test message",
                                         "ports-api-testing")

        expect(return_value).must_equal true
      end
    end

    it "generates an error if given an invalid channel" do
      VCR.use_cassette("slack_message") do
        expect {
          SlackApi.send_msg("Test message",
                            "bogus")
        }.must_raise SlackApi::SlackError
      end
    end
    it "will generate an error if given an invalid key" do
    end

    it "will raise an error if given an empty message" do
    end
  end
end
