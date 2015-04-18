require 'spec_helper'

describe Yhoshino11Todo::DB do
  context 'initial state' do
    before { Yhoshino11Todo::DB.prepare }
    let(:database) { Yhoshino11Todo::DB.prepare }
    it 'is empty' do
      expect(database).to eq nil
    end

    it 'is CRUD' do
      task = create(:task)
      expect(Yhoshino11Todo::Task.count).to eq 1
    end
  end
end
