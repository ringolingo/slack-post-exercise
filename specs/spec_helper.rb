require 'minitest/autorun'
require 'minitest/reporters'
require_relative '../lib/twitter_api_wrapper'



Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
