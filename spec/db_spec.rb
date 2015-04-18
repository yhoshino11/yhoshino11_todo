require 'spec_helper'

describe Yhoshino11Todo::DB do
  before { Yhoshino11Todo::DB.prepare }

  context 'initial state' do
    let(:database) { Yhoshino11Todo::DB.prepare }
    it 'is empty' do
      expect(database).to eq nil
    end
  end
  it 'is CRUD' do
    task = create(:task)
    expect(Yhoshino11Todo::Task.count).to eq 1
  end

  context 'validates' do
    it 'with nil' do
      task = build(:task, name: nil, content: nil)
      expect(task).not_to be_valid
    end

    it 'max length of name is 140' do
      task = build(:task, name: 'a'*141)
      expect(task).not_to be_valid
    end

    it 'status' do
      task = build(:task, status: 'DOING')
      expect(task).not_to be_valid
    end
  end
end
