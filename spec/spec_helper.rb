require "codeclimate-test-reporter"
CodeClimate::TestReporter.start
require 'coveralls'
Coveralls.wear! do
  add_filter '.bundle'
end
require 'simplecov'
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
    Coveralls::SimpleCov::Formatter
]
SimpleCov.start do
  add_filter '.bundle'
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'yhoshino11_todo'

ActiveRecord::Base.establish_connection adapter: 'sqlite3',database: ':memory:'
RSpec.configure do |config|
  require 'factory_girl'
  require 'database_cleaner'
  require 'factories'
  config.include FactoryGirl::Syntax::Methods
  config.before(:all) do
    DatabaseCleaner.clean_with :truncation
    FactoryGirl.reload
    # FactoryGirl.lint
  end
  config.after(:all) do
    DatabaseCleaner.clean_with :truncation
  end
end
