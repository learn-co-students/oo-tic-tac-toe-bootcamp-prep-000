module TicTacToe
  module Helpers
    refine String do
      def blank?
        strip.empty?
      end
    end
    
    refine NilClass do
      def blank?
        true
      end
    end
  end
  
  using Helpers
  
  # The nature of a TicTacToe board
  class Board
    WIN_COMBINATIONS = [
      [0, 1, 2], # Top row 
      [3, 4, 5], # Middle row
      [6, 7, 8], # Bottom row
      [0, 3, 6], # Left column
      [1, 4, 7], # Middle column
      [2, 5, 8], # Right column
      [0, 4, 8], # Left diagonal
      [2, 4, 6]  # Right diagonal 
    ]
    
    def initialize(cells = Array.new(9, " "))
      @cells = cells 
    end
    
    def to_s
      <<-BOARD
 #{@cells[0]} | #{@cells[1]} | #{@cells[2]} 
-----------
 #{@cells[3]} | #{@cells[4]} | #{@cells[5]} 
-----------
 #{@cells[6]} | #{@cells[7]} | #{@cells[8]} 
BOARD
    end
    
    def move(i, player = "X")
      return false unless valid_move? i
      @cells[i] = player
      @cells
    end
    
    def position_taken?(index)
      !@cells[index].blank?
    end
    
    def valid_move?(index)
      index.between?(0, 8) && !position_taken?(index)
    end
    
    def turn_count
      @cells.count { |cell| !cell.blank? }
    end
    
    def won?
      WIN_COMBINATIONS.detect do |i, j, k|
        positions = [i, j, k].map { |p| @cells[p] }
        position_taken?(i) && positions.all? { |p| p == positions[0] }
      end
    end
    
    def full?
      @cells.all? { |position| !position.blank? }
    end
    
    def draw?
      !won? && full?
    end
    
        
    def winner
      win = won?
      @cells[win[0]] if win
    end
  end 
  
  # Talking to the user
  class Game
    def initialize(board = Board.new)
      @board = board
    end
    
    def display_board
      puts @board.to_s
    end
    
    def input_to_index(input)
      input.to_i - 1 
    end 
    
    def turn
      puts "Please enter 1-9:"
      input = gets.strip
      player = current_player 
      i = input_to_index(input)
      if @board.move(i, player)
        display_board
      else
        puts "Please enter another input"
        turn
      end
    end
    
    def current_player
      @board.turn_count.even? ? "X" : "O"
    end
    
    def over?
      @board.won? || @board.full? || @board.draw?
    end
    
    def play
      until over?
        turn
      end
      
      if @board.won?
        puts "Congratulations #{@board.winner}!"
      else 
        puts "Cat's Game!"
      end
    end
  end
end