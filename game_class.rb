require './player_class.rb'
require './question_class.rb'

class Game

  def start
    puts "Welcome to today's edition of the Math Addition Game!"
    puts "Player 1, please enter your name:"
    print "> "
    @player1 = Player.new(gets.chomp)
    puts "Player 2, please enter your name:"
    print "> "
    @player2 = Player.new(gets.chomp)
    puts "Welcome #{@player1.name} and #{@player2.name}. Let the games begin!"
    @player1.turn = true
    questions
  end
  
  def questions
      question = Question.new
      ask_question = question.question
      @q_answer = question.answer
      if @player1.turn
        puts "#{@player1.name}, #{ask_question}"
        print "> "
        correct_answer
      else
        puts "#{@player2.name}, #{ask_question}"
        print "> "
        correct_answer
      end
  end

  def correct_answer
    answer = $stdin.gets.chomp.to_i
      if @player1.turn
        if answer == @q_answer
          puts "YES! You are correct!"
        else
          puts "Seriously? No!"
          @player1.lives -= 1
        end
        @player1.turn = false
        @player2.turn = true
      else
        if @player2.turn
          if answer == @q_answer
            puts "YES! You are correct!"
          else
            puts "Seriously? No!"
            @player2.lives -= 1
          end
          @player2.turn = false
          @player1.turn = true
        end
      end
      game_over
  end

  def game_over
    if @player1.lives == 0
      puts "--- Game Over ---"
      puts "You are out of lives! #{@player2.name} wins!"
      puts "Good bye!"
    elsif @player2.lives == 0
      puts "--- Game Over ---"
      puts "You are out of lives! #{@player1.name} wins!"
      puts "Good bye!"
    else
      questions
    end
  end

end

