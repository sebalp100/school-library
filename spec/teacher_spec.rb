require_relative 'spec_helper'

describe Teacher do
  describe '#initialize' do
    it 'creates a new teacher with the correct name, age, and specialization' do
      teacher = Teacher.new(35, 'Martha', 'Math')
      expect(teacher.name).to eq('Martha')
      expect(teacher.age).to eq(35)
      expect(teacher.specialization).to eq('Math')
    end

    it 'parent_permission its true by default' do
      teacher = Teacher.new(45, 'Smith', 'English')
      expect(teacher.instance_variable_get(:@parent_permission)).to eq(true)
    end
  end

  describe '#can_use_services?' do
    it 'returns true for a teacher' do
      teacher = Teacher.new(30, 'Davis', 'History')
      expect(teacher.can_use_services?).to eq(true)
    end
  end
end
