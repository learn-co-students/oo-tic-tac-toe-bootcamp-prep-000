class TicTacToe
    def initialize
      @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end 
    
    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [2,5,8],
      [1,4,7],
      [0,3,6],
      [0,4,8], 
      [2,4,6]
    ]
    
    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end 
  
    def input_to_index(input)
      input.to_i - 1 
    end 
  
    def move(index, player)
      @board[index] = player
    end 
  
    def position_taken?(index)
      @board[index] != " "
    end 
  
    def valid_move?(index)
      index.between?(0,8) && !position_taken?(index)
    end 
  
    def turn_count
      counter = 0 
      @board.each do |el|
        if el == "X" || el =="O"
          counter += 1 
        end
      end
      counter
    end 
    
    def current_player
      if turn_count % 2 == 0  
        "X"
      else 
        "O"
      end 
    end 
    
    def turn 
      puts "Please enter a number (1-9):"
      input = gets.strip 
      index = input_to_index(input)
      if valid_move?(index)
        player = current_player
        move(index, player)
      else 
        turn 
      end 
      display_board
    end
    
    def won?
      WIN_COMBINATIONS.any? do |win_combination|
        if position_taken?(win_combination[0]) && @board[win_combination[0]] == @board[win_combination[1]] && @board[win_combination[1]] == @board[win_combination[2]]
          return win_combination
        end 
      end 
    end 
    
    def full?
      # remember to use .all and iterate 
      @board.all?{|x| x != " " }
    end 
    
    def draw?
      full? && !won?
    end 
    
    def over?
      won? || draw?
    end 
    
    def winner
      if win_combination = won?
        @board[win_combination[0]]
      end 
    end 
    
    def play 
      turn until over?
      puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    end 
  end 
  