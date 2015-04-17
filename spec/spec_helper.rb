require "codeclimate-test-reporter"
CodeClimate::TestReporter.start
require 'coveralls'
Coveralls.wear!

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'yhoshino11_todo'

RSpec.configure do |config|
  require 'factory_girl'
  require 'database_cleaner'
  config.include FactoryGirl::Syntax::Methods
  config.before do
    ActiveRecord::Base.establish_connection adapter: 'sqlite3',database: ':memory:'
    begin
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.start
      FactoryGirl.lint
    ensure
      DatabaseCleaner.clean
    end
  end
end
