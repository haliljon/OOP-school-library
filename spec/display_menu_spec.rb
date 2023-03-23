require './main/display_menu'

describe DisplayMenu do
  display = DisplayMenu.new

  context 'When testing the DisplayMenu class' do
    it 'should check if it is returning a string' do
      expect(display.print_menu).to respond_to(:to_s)
    end
  end
end
