require_relative 'spec_helper'

describe Nameable do
  describe '#correct_name' do
    it 'raises an NotImplementedError' do
      nameable = Nameable.new
      expect { nameable.correct_name }.to raise_error(NotImplementedError)
    end
  end
end
