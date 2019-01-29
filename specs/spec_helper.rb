require 'dotenv'
Dotenv.load

require 'minitest/autorun'
require 'minitest/reporters'
require 'vcr'
require 'webmock/minitest'



require_relative '../lib/slack_api_wrapper'



Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

VCR.configure do |config|
  config.cassette_library_dir = 'specs/cassettes' # folder where casettes will be located
  config.hook_into :webmock # tie into this other tool called webmock
  config.default_cassette_options = {
    record: :new_episodes,    # record new data when we don't have it yet
    match_requests_on: [:method, :uri, :body] # The http method, URI and body of a request all need to match
  }
  # Don't leave our Twitter tokens lying around in a cassette file.
  ['TWITTER_ACCESS_TOKEN', 'TWITTER_SECRET_KEY'].each do |env_variable|
    config.filter_sensitive_data(env_variable) do
      ENV[env_variable]
    end
  end
end
