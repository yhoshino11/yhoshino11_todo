require 'spec_helper'

describe Yhoshino11Todo do
  let(:version) { Yhoshino11Todo::VERSION }

  it 'has a version number' do
    expect(version).not_to be nil
  end

  it 'is v0.0.1' do
    expect(version).to eq('0.0.1')
  end
end
