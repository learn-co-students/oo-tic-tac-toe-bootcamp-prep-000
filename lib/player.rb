require_relative '../config/environment.rb'

# The Player class is the basic player object
# setting player attributes and game logic to determine
# a winning play
class Player
  attr_accessor :name, :token, :token_set, :winning_index

  def initialize
    input = gets.strip
    @name = if input != ''
              input
            else
              'HAL'
            end
    @token_set = []
  end

  def move(board, position, token)
    index = position.to_i - 1
    board[index] = token
    puts ''
    board.display
    puts ''
  end

  def square_taken?(board, index)
    !(board[index].nil? || board[index] == ' ')
  end

  def valid_move?(board, position)
    index = position.to_i - 1
    index.between?(0, 8) && !square_taken?(board, index)
  end

  def win_possible?(opponent)
    win_combos = MatchRules::WIN_COMBINATIONS
    win_combos.each do |win_combo|
      win_combo.each do |win_index|
        @token_set.each do |token|
          next unless win_index == token
          win_combo -= [win_index]
          next unless win_combo.length == 1
          @winning_index = win_combo[0]
          next unless opponent.token_set.none? { |i| i == @winning_index }
          return true
        end
      end
    end
    false
  end
end
