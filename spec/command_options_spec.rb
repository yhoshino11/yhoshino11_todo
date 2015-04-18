require 'spec_helper'

describe Yhoshino11Todo::Command do
  let(:command) { Yhoshino11Todo::Command }
  it 'shows version' do
    action = `bundle exec ruby bin/yhoshino11_todo -v`
    current_version = Yhoshino11Todo::VERSION
    expect(action).to eq("yhoshino11_todo #{current_version}\n")
  end
end