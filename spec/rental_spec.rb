require_relative 'spec_helper'

describe Rental do
  before :each do
    @book = Book.new(23, 'Bible', 'Inspired Men')
    @person = Person.new(10, 12, 'Inspired Men')
    @rental = Rental.new(20, @book, @person)
  end

  it 'Should have a instance' do
    expect(@rental).to be_instance_of Rental
  end

  it 'Should have to date of ' do
    date = @rental.date
    expect(date).to eql(20)
  end

  it 'Should have a book name of Bible' do
    book_name = @book.title
    expect(book_name).to eq('Bible')
  end

  it 'Should have an Name of Inspired Men' do
    person_name = @person.name
    expect(person_name).to eq('Inspired Men')
  end
end
