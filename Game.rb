require_relative "Player"
require_relative "Question"

class Game

  attr_accessor :current_player

  def initialize
    @first_player = Player.new("Player 1")
    @second_player = Player.new("Player 2")
    @current_player = @first_player
  end

  def start_game
    
    p "#{current_player.name}: Enter a number from 1 to 20"
    num = gets.chomp
    num1 = num.to_i
    p "#{current_player.name}: Enter a second number"
    num = gets.chomp
    num2 = num.to_i
    new_question = Question.new(num1, num2)
    p "#{current_player.name}: #{new_question.question}?"
    num = gets.chomp
    answer = num.to_i
    game_end = check(new_question, answer)
    if game_end === false
      start_game
    end
  end

  def switch_player
    if @current_player === @first_player
      @current_player = @second_player
    else 
      @current_player = @first_player
    end
  end

  def check(new_question, answer)
    if answer === new_question.sum
      @current_player.score = @current_player.score + 1
      puts "P1: #{@first_player.lives}/3 vs P2:#{@second_player.lives}/3"
      switch_player
      return false
    else
      puts "incorrect"
      @current_player.lose_life
      puts "P1: #{@first_player.lives}/3 vs P2: #{@second_player.lives}/3"
      if @current_player.lives === 0
        puts "----- GAME OVER -----"
        switch_player
        puts "#{@current_player.name} wins with a score of #{@current_player. score}/#{Question.count}"
        return true
      else
        switch_player
        return false
      end
    end

  end

end











