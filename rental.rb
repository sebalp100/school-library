require_relative 'book'
require_relative 'person'
require 'date'

class Rental
  attr_accessor :date, :book, :person

  def initialize(person, book, date)
    @date = date
    @book = book
    @person = person
    book.rentals << self
    person.rentals << self
  end
end
