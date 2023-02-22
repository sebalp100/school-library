require_relative 'spec_helper'

describe Decorator do
  before do
    @nameable = double('Nameable', correct_name: 'John Smith')
    @decorator = Decorator.new(@nameable)
  end

  describe '#correct_name' do
    it 'returns the correct name' do
      expect(@decorator.correct_name).to eq('John Smith')
    end
  end
end

describe CapitalizeDecorator do
  before do
    @nameable = double('Nameable', correct_name: 'john smith')
    @decorator = CapitalizeDecorator.new(@nameable)
  end

  describe '#correct_name' do
    it 'capitalizes the correct name' do
      expect(@decorator.correct_name).to eq('John smith')
    end
  end
end

describe TrimmerDecorator do
  context 'when the name is longer than 10 characters' do
    before do
      @nameable = double('Nameable', correct_name: 'John William Smith')
      @decorator = TrimmerDecorator.new(@nameable)
    end

    describe '#correct_name' do
      it 'trims the correct name to 10 characters' do
        expect(@decorator.correct_name).to eq('John Willi')
      end
    end
  end

  context 'when the name is shorter than or equal to 10 characters' do
    before do
      @nameable = double('Nameable', correct_name: 'John Smith')
      @decorator = TrimmerDecorator.new(@nameable)
    end

    describe '#correct_name' do
      it 'returns the correct name of the decorated object' do
        expect(@decorator.correct_name).to eq('John Smith')
      end
    end
  end
end
