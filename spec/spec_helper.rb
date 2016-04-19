require "coveralls"

Coveralls.wear! if ENV["COVERAGE"] == "true"

require "rspec"
require "rspec/expectations"
require "rspec/mocks"

require_relative "./support/shared_examples/matching_string_generator"
require_relative "../lib/regxing"
