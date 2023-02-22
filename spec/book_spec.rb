require_relative 'spec_helper'

describe Book do
  before :each do
    @book = Book.new 'Title', 'Author'
    @person = Person.new 22, 'Alice'
    @date = Date.today
  end

  describe '#new' do
    it 'takes two parameters and returns a Book object' do
      @book.should be_an_instance_of Book
    end
  end

  describe '#title' do
    it 'returns the correct title' do
      @book.title.should eql 'Title'
    end
  end

  describe '#author' do
    it 'returns the correct author' do
      @book.author.should eql 'Author'
    end
  end

  describe '#add_rental' do
    it 'adds a rental to the book' do
      @book.add_rental(@person, @book, @date)
      expect(@book.rentals.size).to eq(2)
    end

    it 'creates a new rental with the given person, book, and date' do
      @book.add_rental(@person, @book, @date)
      @rental = @book.rentals.first
      expect(@rental.person).to eq(@person)
      expect(@rental.book).to eq(@book)
      expect(@rental.date).to eq(@date)
    end
  end
end
