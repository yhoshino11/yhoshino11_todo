require 'spec_helper.rb'

describe Yhoshino11Todo::Command do
  let(:command) { Yhoshino11Todo::Command.new }
  let(:tasks) { Yhoshino11Todo::Task }
  let(:task) { build(:task) }

  context 'initial state' do
    it 'is nil' do
      expect(command.execute).to be nil
    end
  end

  context 'allows' do
    it 'to create' do
      command.create_task(task[:name], task[:content])
      expect(tasks.count).to eq(1)
    end

    it 'to search' do
      expect(tasks.where(name: task[:name]).first.id).to eq(1)
    end
  end
end
