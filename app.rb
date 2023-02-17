require_relative 'book'
require_relative 'person'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

class App
  attr_accessor :books, :people, :rentals
  attr_reader :date

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_all_books
    puts 'Books:'
    @books.each do |book|
      puts book.title
    end
  end

  def list_all_people
    puts 'People:'
    @people.each do |person|
      case person
      when Student
        puts "#{person.id}: #{person.name} (Student)"
      when Teacher
        puts "#{person.id}: #{person.name} (Teacher)"
      end
    end
  end

  def create_person(type, age, name, specialization_or_classroom, parent_permission)
    person = type.new(age, name, specialization_or_classroom, parent_permission: parent_permission)
    @people << person
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
  end

  def create_rental(person, book, date)
    if person.nil? || book.nil?
      puts 'Error: person or book is not valid'
    else
      rental = Rental.new(person, book, date)
      @rentals << rental
    end
  end

  def list_person_rentals(id)
    person = @people.find { |p| p.id == id }
    if person.nil?
      puts "Person not found with id #{id}"
      return
    end
    rentals = @rentals.select { |rental| rental.person == person }
    if rentals.empty?
      puts "Person with id #{id} has no rentals"
      return
    end
    puts "Rentals for person with id #{id}:"
    rentals.each do |rental|
      puts "#{rental.person.name} rented #{rental.book.title} on #{rental.date}"
    end
  end
end
