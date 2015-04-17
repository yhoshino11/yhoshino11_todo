require "codeclimate-test-reporter"
CodeClimate::TestReporter.start
require 'coveralls'
Coveralls.wear!

RSpec.configure do |config|
  require 'factory_girl'
  config.include FactoryGirl::Syntax::Methods
end
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'yhoshino11_todo'
