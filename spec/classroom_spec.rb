require_relative 'spec_helper'

describe Classroom do
  let(:label) { 'Math Class' }
  let(:classroom) { Classroom.new(label) }
  let(:student) { double('student', classroom: nil) }

  describe '#new' do
    it 'returns a new Classroom object' do
      expect(classroom).to be_an_instance_of Classroom
    end
  end

  describe '#initialize' do
    it 'sets the correct label' do
      expect(classroom.label).to eq(label)
    end

    it 'initializes an empty students array' do
      expect(classroom.students).to eq(nil)
    end
  end
end
