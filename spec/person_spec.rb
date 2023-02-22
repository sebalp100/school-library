require_relative 'spec_helper'

describe Person do
  let(:person) { Person.new(20, 'Alice') }
  let(:book) { Book.new('The Great Gatsby', 'F. Scott Fitzgerald') }
  let(:date) { Date.today }

  describe '#add_rental' do
    it 'adds a rental to the person' do
      person.add_rental(person, book, date)
      expect(person.rentals.size).to eq(2)
    end

    it 'creates a new rental with the given person, book, and date' do
      person.add_rental(person, book, date)
      rental = person.rentals.first
      expect(rental.person).to eq(person)
      expect(rental.book).to eq(book)
      expect(rental.date).to eq(date)
    end
  end

  describe '#correct_name' do
    it 'returns the name of the person' do
      expect(person.correct_name).to eq('Alice')
    end
  end

  describe '#can_use_services?' do
    context 'when person is of age' do
      let(:person) { Person.new(25, 'Bob') }

      it 'returns true' do
        expect(person.can_use_services?).to eq(true)
      end
    end

    context 'when person is underage and has parent permission' do
      let(:person) { Person.new(16, 'Charlie') }

      it 'returns true' do
        expect(person.can_use_services?).to eq(true)
      end
    end

    context 'when person is underage and does not have parent permission' do
      let(:person) { Person.new(16, 'David', parent_permission: false) }

      it 'returns false' do
        expect(person.can_use_services?).to eq(false)
      end
    end
  end
end
