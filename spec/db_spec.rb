require 'spec_helper'

describe Yhoshino11Todo::DB do
  context 'initial state' do
    before { Yhoshino11Todo::DB.prepare }
    let(:database) { Yhoshino11Todo::DB.prepare }
    it 'is empty' do
      expect(database).to be nil
    end
  end
end
