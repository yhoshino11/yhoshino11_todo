require "codeclimate-test-reporter"
CodeClimate::TestReporter.start
require 'coveralls'
Coveralls.wear!

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'yhoshino11_todo'

RSpec.configure do |config|
  require 'factory_girl'
  ActiveRecord::Base.establish_connection adapter: 'sqlite3',database: ':memory:'
  config.include FactoryGirl::Syntax::Methods
end
