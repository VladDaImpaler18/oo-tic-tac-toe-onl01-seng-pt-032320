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
  

end
