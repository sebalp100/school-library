require_relative 'spec_helper'

describe Rental do
  it 'Should create an instance of the Rental class' do
    @book = double('book')
    @person = double('person')

    allow(@book).to receive(:rentals).and_return([])
    allow(@person).to receive(:rentals) { [] }
    @rental = Rental.new @person, @book, '12-12-1999'

    expect(@rental).to be_instance_of Rental
  end
end
