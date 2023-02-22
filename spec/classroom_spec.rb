require_relative 'spec_helper'

describe Classroom do
  before :each do
    @classroom = Classroom.new 'C2023'
  end

  it 'Should create a new instance of Classroom' do
    expect(@classroom).to be_instance_of Classroom
  end

  it 'Should add a student to a classroom' do
    student = double('student')
    allow(student).to receive(:classroom=)
    @classroom.add_student student

    expect(@classroom.students).to eql [student]
  end
end
