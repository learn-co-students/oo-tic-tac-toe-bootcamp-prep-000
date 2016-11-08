class Player

  attr_reader :name
  attr_accessor :token

  def initialize
    @name = gets.strip
  end

end