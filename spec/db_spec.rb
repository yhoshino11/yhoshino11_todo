require 'spec_helper'

describe Yhoshino11Todo::DB do
  context 'initial state' do
    it 'is empty' do
      expect(Yhoshino11Todo::DB.prepare).to be nil
    end
  end
end
