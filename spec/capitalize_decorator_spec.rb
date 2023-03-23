require_relative 'spec_helper'

describe Decorator do
  context 'When testing the Decorator class' do
    it 'Should create a new instance of Decorator' do
      new_person = Person.new(10, 20, 'Kdot')
      expect(Decorator.new(new_person)).to be_instance_of(Decorator)
    end
  end
end
