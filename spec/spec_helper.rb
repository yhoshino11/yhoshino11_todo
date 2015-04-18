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

RSpec.configure do |config|
  require 'factory_girl'
  config.include FactoryGirl::Syntax::Methods
  config.before do
    FactoryGirl.lint
  end
end
