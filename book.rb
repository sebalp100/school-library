require_relative 'person'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, book, date)
    rental = Rental.new(person, book, date)
    @rentals.push(rental)
  end
end
