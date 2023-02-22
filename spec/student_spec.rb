require_relative 'spec_helper'

describe Student do
  before(:each) do
    @classroom = Classroom.new('Math')
    @student = Student.new('Alice', 16, @classroom)
  end

  describe '#label=' do
    it 'sets the label of the student' do
      @student.label = 'A+'
      expect(@student.label).to eq('A+')
    end

    it 'adds the student to the classroom if they are not already there' do
      @student.label = 'B-'
      expect(@classroom.students).to include(@student)
    end

    it 'does not add the student to the classroom if they are already there' do
      @classroom.students << @student
      expect { @student.label = 'C+' }.not_to(change { @classroom.students.size })
    end
  end

  describe '#play_hooky' do
    it 'prints a message' do
      expect { @student.play_hooky }.to output("¯(ツ)/¯\n").to_stdout
    end
  end
end
