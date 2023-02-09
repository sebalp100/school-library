require_relative 'person'
require_relative 'classroom'

class Student < Person
  attr_accessor :name, :age, :classroom
  attr_reader :label

  def initialize(name, age, classroom, parent_permission: true)
    super(name, age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def label=(label)
    @label = label
    label.student.push(self) unless label.student.include?(self)
  end

  def play_hooky
    puts '¯(ツ)/¯'
  end
end
