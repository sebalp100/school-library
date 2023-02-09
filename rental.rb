require_relative 'book'
require_relative 'person'
require 'date'

class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = Date.parse(date.to_s)
    @book = book
    @person = person
    book.rentals << self
    person.add_rental(self)
  end
end
