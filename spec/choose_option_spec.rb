require './main/choose_option'

describe ChooseOption do
  choice = ChooseOption.new

  context 'When testing the ChooseOption class' do
    it 'should check if it is returning an array' do
      expect(choice.choose_option(1)).to be_an_instance_of Array
    end

    it 'should check if it is returning an array' do
      expect(choice.choose_option(2)).to be_an_instance_of Array
    end

    it 'should exit the program' do
      expect(choice.choose_option(7)).to eq 'Thank you for using this app!'
    end

    it 'should not return a valid option' do
      expect(choice.choose_option(8)).to eq 'That is not a valid option'
    end
  end
end
