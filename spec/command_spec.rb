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

    it 'to update' do
      task = tasks.first
      task = command.update_task(task.id, {content: 'new_task',status: 'done'})
      expect(task[:status]).to eq(1)
    end

    it 'to destroy' do
      task = tasks.first
      command.delete_task(task.id)
      expect(tasks.count).to eq(0)
    end
  end
end
