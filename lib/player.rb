require_relative '../config/environment.rb'

# The Player class is the basic player object
# setting player attributes and game logic to determine
# a winning play
class Player
  attr_accessor :name, :token, :token_set, :winning_index, :player_num, :opponent

  CORNERS = Match::CORNERS
  SIDES = Match::SIDES
  CENTER = Match::CENTER

  def initialize
    input = gets.strip
    @name = if input != ''
              input
            else
              'HAL'
            end
    puts @name if @name == 'HAL'
    @token_set = []
  end

  def is_player_one?
    @player_num == 1
  end

  def move(board, index, token)
    board[index] = token
    display_board(board)
  end

  def display_board(board)
    puts ''
    board.display
    puts ''
  end

  def square_taken?(board, index)
    !(board[index].nil? || board[index] == ' ')
  end

  def valid_move?(board, index)
    index.between?(0, 8) && !square_taken?(board, index)
  end

  def win_possible?(opponent)
    win_combos = Match::WIN_COMBINATIONS
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
