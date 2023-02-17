require_relative 'app'

def display_menu
  puts 'What would you like to do?'
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List rentals for a person'
  puts '7. Quit'
end

def menu_choice
  print 'Enter the number of your choice: '
  gets.chomp.to_i
end

def handle_menu_choice(choice, app)
  case choice
  when 1
    app.list_all_books
  when 2
    app.list_all_people
  when 3, 4, 5
    create_item(choice, app)
  when 6
    list_rentals(app)
  when 7
    return true
  else
    puts 'Invalid option entered'
  end
  false
end

def create_item(choice, app)
  case choice
  when 3
    create_person(app)
  when 4
    create_book(app)
  when 5
    create_rental(app)
  end
end

def create_person(app)
  print "Person's name: "
  name = gets.chomp
  print "Person's age: "
  age = gets.chomp.to_i
  print "Person's type (Student/Teacher): "
  type = gets.chomp
  case type
  when 'Student'
    print 'Classroom: '
    classroom = gets.chomp
    print 'Parent permission (true/false): '
    parent_permission = gets.chomp
    app.create_person(Student, age, name, classroom, parent_permission)
  when 'Teacher'
    print 'Specialization: '
    specialization = gets.chomp
    app.create_person(Teacher, age, name, specialization, parent_permission)
  else
    puts 'Invalid type'
  end
end

def create_book(app)
  print "Book's title: "
  title = gets.chomp
  print "Book's author: "
  author = gets.chomp
  app.create_book(title, author)
end

def create_rental(app)
  print "Person's id: "
  id = gets.chomp.to_i
  person = app.people.find { |p| p.id == id }
  if person.nil?
    puts "Person not found with id #{id}"
  else
    print "Book's title: "
    title = gets.chomp
    book = app.books.find { |b| b.title == title }
    if book.nil?
      puts "Book not found with title #{title}"
    else
      print 'Rental date: '
      date = gets.chomp
      app.create_rental(person, book, date)
    end
  end
end

def list_rentals(app)
  print "Person's id: "
  id = gets.chomp.to_i
  app.list_person_rentals(id)
end

def main
  app = App.new
  quit = false
  until quit
    display_menu
    choice = menu_choice
    quit = handle_menu_choice(choice, app)
  end
end

main
