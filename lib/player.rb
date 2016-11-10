class Player

  attr_reader :name
  attr_accessor :token

  def initialize
    @name = gets.strip
  end

  def get_token
    puts "#{@name}, please select a token. (X/O)"
    @token = gets.strip.upcase
    if @token != 'X' && @token != 'O'
      get_token
    end
    puts ''
    puts "You have selected #{@token}."
    puts ''
    sleep(1)
  end

end