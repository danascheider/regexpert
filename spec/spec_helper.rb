require "coveralls"

Coveralls.wear! if ENV["COVERAGE"] == "true"

require "rspec"
require "rspec/expectations"
require "rspec/mocks"

require_relative "../lib/regexpert"
