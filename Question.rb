

class Question 
  @@count = 0
  attr_accessor :question, :sum

  def initialize(num1, num2)
    @@count += 1
    @question = " What is the sum of #{num1} and #{num2}"
    @sum = num1 + num2
  end

  def self.count
    @@count
  end

end