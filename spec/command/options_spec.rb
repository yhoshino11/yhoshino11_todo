require 'spec_helper'

describe Yhoshino11Todo::Command::Options do
  context 'from command line' do
    let(:option) { Yhoshino11Todo::Command::Options }
    it 'shows version' do
      action = `bundle exec ruby bin/yhoshino11_todo -v`
      current_version = Yhoshino11Todo::VERSION
      expect(action).to eq("yhoshino11_todo #{current_version}\n")
    end

    context 'allows options' do
      it 'to create' do
        options = option.parse!(['create', '-n name_val'])
        expect(options).to eq({ command: 'create', name: ' name_val' })
      end

      it 'to search' do
        options = option.parse!(['search', '-s done'])
        expect(options).to eq({ command: 'search', status: ' done' })
      end

      context 'to update' do
        it 'name' do
          options = option.parse!(['update', '-n another_name'])
          expect(options).to eq({ command: 'update', name: ' another_name' })
        end

        it 'content' do
          options = option.parse!(['update', '-c another_content'])
          expect(options).to eq({ command: 'update', content: ' another_content' })
        end

        it 'status' do
          options = option.parse!(['update', '-s pending'])
          expect(options).to eq({ command: 'update', status: ' pending' })
        end
      end
    end
  end
end
