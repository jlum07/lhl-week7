require './player.rb'
require './question.rb'

class Game

  def initialize
    @player1 = Player.new("Justin")
    @player2 = Player.new("Michelle")

    @players = [@player1, @player2]
  end

  def ask_question
    puts "#{@current_player.name}: What does #{@question.first_num} plus #{@question.second_num} equal?"
  end

  def check_answer(a)
    if a == @question.answer
      puts "#{@current_player.name}: YES! You are correct."
    else
      puts "#{@current_player.name}: Seriously? No!"
      @current_player.lose_life
    end
  end

  def summary
    "#{@player1.summary} vs #{@player2.summary}"
  end

  def game_over?
    players.count == 1
  end

  def players
    @players.select { |player| !player.dead? }
  end

  def rotate_player
    @players = @players.rotate
  end

  def find_winner
    players.first
  end

  def run
    while !game_over?

      @current_player = @players.first
      rotate_player

      @question = Question.new


      puts "----- NEW TURN -----"

      # puts "#{@current_player.name}: What does #{@question.first_num} plus #{@question.second_num} equal?"
      ask_question


      print ">"
      player_answer = gets.chomp.to_i
      check_answer(player_answer)

      puts summary

    end

    winner = find_winner
    puts "#{winner.name} wins with a score of #{winner.lives}/3"

  end








end