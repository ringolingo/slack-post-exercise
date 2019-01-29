# spec_helper.rb
require 'dotenv'
Dotenv.load

require 'minitest/autorun'
require 'minitest/reporters'
require 'vcr'
require 'webmock/minitest'
require_relative '../lib/slack_api_wrapper'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

