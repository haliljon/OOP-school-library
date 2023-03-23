require './book'

describe Book do
  book = Book.new :id, '1984', 'George Orwell'

  context 'When testing the Book class' do
    it 'should return the correct title' do
      expect(book.title).to eq '1984'
    end

    it 'should return the correct author' do
      expect(book.author).to eq 'George Orwell'
    end
  end
end
