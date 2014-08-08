require 'bundler/setup'
require 'vcr'
require 'pry'

Bundler.setup

require 'fappu'

VCR.configure do |vcr|
  vcr.cassette_library_dir = 'fixtures/cassettes'
  vcr.default_cassette_options = {record: :once}
  vcr.configure_rspec_metadata!
  vcr.hook_into :webmock
end

RSpec.configure do |config|
  config.color = true
  config.tty = true
  config.failure_color = :magenta
  # optional config here
end
