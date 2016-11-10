require_relative 'win_logic.rb'

class CPU
  include WinLogic
  attr_reader :name
  attr_accessor :token, :token_set, :winning_position

  def initialize
    input = gets.strip
    @name = if input != ''
              input
            else
              'HAL'
            end
    @token_set = []
  end

  def sets_token(opposition)
    @token = if opposition.token == 'X'
               'O'
             else
               'X'
             end
  end

  def best_move(board, cpu, opponent)
    status(board, cpu, opponent)
    if cpu.win_possible?(opponent)
      cpu.winning_position
    elsif opponent.win_possible?(cpu)
      opponent.winning_position
    elsif opponent.token_set.length == 1
      opponent.token_set[0] == 4 ? 0 : 4
    else
      rand(9)
    end
  end

  def turn(board, opponent)
    input = best_move(board, self, opponent) + 1
    make_move(board, opponent, input)
  end

  def make_move(board, opponent, input)
    if valid_move?(board, input)
      move(board, input, @token)
      puts "#{self.name}: I'll pick #{input}."
      sleep(1)
      puts ''
      board.display
      puts ''
    else
      turn(board, opponent)
    end
  end
end
