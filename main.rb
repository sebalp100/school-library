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
  print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
  type = gets.chomp.to_i
  case type
  when 1
    print 'Classroom: '
    classroom = gets.chomp
    print 'Parent permission (true/false): '
    parent_permission = gets.chomp
    app.create_person(Student, age, name, classroom, parent_permission)
    puts 'Person created succesfully', ''
  when 2
    print 'Specialization: '
    specialization = gets.chomp
    app.create_person(Teacher, age, name, specialization, parent_permission)
    puts 'Person created succesfully', ''
  end
end

def create_book(app)
  print "Book's title: "
  title = gets.chomp
  print "Book's author: "
  author = gets.chomp
  app.create_book(title, author)
  puts 'Book created succesfully', ''
end

def create_rental(app)
  puts 'Select a book from the following list by number'
  app.list_all_books
  book_num = gets.chomp.to_i
  book = app.books[book_num - 1]
  if book.nil?
    puts 'Invalid book number'
  else
    puts 'Select a person from the following list by number (not id)'
    app.list_all_people
    person_id = gets.chomp.to_i
    person = app.people[person_id - 1]
    if person.nil?
      puts "Person not found with number #{person_id}"
    else
      print 'Enter the rental date (YYYY-MM-DD): '
      rental_date = gets.chomp
      app.create_rental(person, book, rental_date)
      puts "Rental created for '#{book.title}' by #{person.name}", ''
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
