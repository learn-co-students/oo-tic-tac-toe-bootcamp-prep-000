require_relative 'win_logic.rb'

class Player

  include WinLogic
  attr_reader :name
  attr_accessor :token, :token_set, :winning_position

  def initialize
    @name = gets.strip
    @token_set = Array.new
  end

  def get_token
    puts "#{@name}, please select a token. (X/O)"
    @token = gets.strip.upcase
    if @token != 'X' && @token != 'O'
      get_token
    end
  end

  def puts_token
    puts ''
    puts "You have selected #{@token}."
    puts ''
    sleep(1)
  end

end