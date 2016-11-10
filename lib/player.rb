require_relative 'win_logic.rb'

class Player
  include WinLogic
  attr_reader :name
  attr_accessor :token, :token_set, :winning_position

  def initialize
    @name = gets.strip
    @token_set = []
  end

  def gets_token
    puts ''
    puts "#{@name}, please select a token. (X/O)"
    @token = gets.strip.upcase
    return unless @token != 'X' && @token != 'O'
    gets_token
  end

  def puts_token
    puts ''
    puts "You have selected #{@token}."
    puts ''
    sleep(1)
  end

  def sets_token(opposition)
    if opposition.nil?
      gets_token
      puts_token
    else
      @token = if opposition.token == 'X'
                 'O'
               else
                 'X'
               end
    end
  end
end
