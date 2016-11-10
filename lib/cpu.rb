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
end
