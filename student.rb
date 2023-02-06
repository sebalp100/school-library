require_relative 'person'

class Student < Person

  attr_accessor :classroom

  def initialize(name, age, parent_permission = true, classroom)
    super(name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    puts "¯\(ツ)/¯"
  end
end