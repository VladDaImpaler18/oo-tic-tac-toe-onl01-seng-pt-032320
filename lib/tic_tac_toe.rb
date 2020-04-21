require 'pry'
class TicTacToe
  
  WIN_COMBINATIONS = [
    [0,1,2], #Top row
    [3,4,5], #Middle row
    [6,7,8], #Bottom row
    
    [0,3,6], #Left column
    [1,4,7], #Middle column
    [2,5,8], #Right column
    
    [0,4,8], #topL -> botR
    [2,4,6]  #topR -> botL
  ]
  #[ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]
  
  def initialize
    @board = Array.new(9, " ")
  end
  
  def display_board #from the previous reading
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    user_input = user_input.to_i - 1
  end
  
  def move(user_input, token="X")
    @board[user_input] = token
  end
  
  def position_taken?(index)
    @board[index]!=" "
  end
  
  def valid_move?(index)
     index.between?(0,8) && !position_taken?(index)
  end
  
  def turn
    #puts "Please enter a move. Valid moves are 1-9 -- inclusive"
    input = gets.chomp
    input = input_to_index(input)
    if valid_move?(input)
      move(input)
      display_board
      current_player
    else
      turn
    end
  end
  
  def turn_count
    @board.count{ |number| number != " "}
  end
  
  def current_player
    turn_count%2==0 ? "X" : "O"
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_combo|
      negO_or_threeX = 0 # "O" = -1, "X" = 1: -3 means "O" wins, 3 means "X" wins
      win_combo.each do |position|
        #binding.pry
        negO_or_threeX +=1 if @board[position]=="X"
        negO_or_threeX -=1 if @board[position]=="O"
      end
      if negO_or_threeX == 3 # "X" wins
        return win_combo
      elsif negO_or_threeX == -3 # "O" wins
        return win_combo
      end
    end
    nil
  end

  def full?
    turn_count==9 ? true : false
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
    draw? || won? && full?
  end
  
  def winner
    @board[won?[0]] if won?
  end
  
  #### `#play`

#The play method is the main method of the Tic Tac Toe application and is responsible for the game loop. A Tic Tac Toe game must allow players to take turns, checking if the game is over after every turn. At the conclusion of the game, whether because it was won or ended in a draw, the game should report to the user the outcome of the game. You can imagine the pseudocode:

  def play
    #binding.pry
    while 42 do
      turn
      if over?
        winner if won?
        "Draw!" if draw?
      end
    end
  end
  
  
end
