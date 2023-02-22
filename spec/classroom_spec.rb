require_relative 'spec_helper.rb'

describe Classroom do
    before :each do
        @classroom = Classroom.new 'C2023'
    end

    it 'Should create a new instance of Classroom' do
        expect(@classroom).to be_instance_of Classroom
    end
end