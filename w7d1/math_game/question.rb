
class Question

  attr_reader :first_num, :second_num

  def initialize
    @first_num = rand(20) + 1
    @second_num = rand(20) + 1
  end

  def answer
    @first_num + @second_num
  end

end