require 'spec_helper'

describe Yhoshino11Todo::DB do
  context 'initial state' do
    let(:database) { Yhoshino11Todo::DB.prepare }
    it 'is empty' do
      expect(database).to eq nil
    end
  end
end
