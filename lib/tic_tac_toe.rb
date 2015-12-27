class TicTacToe

  WIN_COMBINATIONS = 
  [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end


  def display_board
   puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
   puts "-----------"
   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
   puts "-----------"
   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(location, current_player = "X")
    @board[location.to_i-1] = current_player
  end

  def position_taken?(location)
   @board[location] != " " && @board[location] != ""
  end

  def valid_move?( position)
    position.to_i.between?(1,9) && !position_taken?( position.to_i-1)
  end

  def turn
     puts "Please enter 1-9:"
     input = gets.strip
    if valid_move?( input)
     move(input, current_player)
    else
     turn
    end
      display_board
  end

  def turn_count
  counter = 0 
   @board.each do |i|
     if i == "X" || i == "O"
      counter += 1
     end
   end
  counter
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
  WIN_COMBINATIONS.detect do |position| 
    @board[position[0]] == @board[position[1]] && 
    @board[position[1]] == @board[position[2]] && 
    @board[position[0]] != " "
    end
  end

  def full?
    @board.all? {|position| position == "X" || position == "O"}
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || full? || draw?
  end

  def winner
     @board[won?[0]] if won?
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end