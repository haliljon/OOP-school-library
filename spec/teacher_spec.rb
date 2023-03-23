require_relative 'spec_helper'

describe Teacher do
  let(:id) { 1 }
  let(:age) { 30 }
  let(:name) { 'John Doe' }
  let(:specialization) { 'Mathematics' }
  let(:teacher) { Teacher.new(id, age, name, specialization) }

  describe '#new' do
    it 'returns a new Teacher object' do
      expect(teacher).to be_an_instance_of Teacher
    end
  end

  describe '#initialize' do
    it 'sets the correct attributes' do
      expect(teacher.id).to eq(id)
      expect(teacher.age).to eq(age)
      expect(teacher.name).to eq(name)
      expect(teacher.specialization).to eq(specialization)
    end
  end

  describe '#can_use_services?' do
    it 'returns true' do
      expect(teacher.can_use_services?).to be_truthy
    end
  end

  describe '#specialization=' do
    it 'sets the specialization' do
      new_specialization = 'History'
      teacher.specialization = new_specialization
      expect(teacher.specialization).to eq(new_specialization)
    end
  end
end
