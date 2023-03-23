class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
  end
end
