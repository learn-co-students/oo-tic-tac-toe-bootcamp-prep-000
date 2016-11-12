require_relative '../config/environment.rb'

# The OnePlayer class is the set of specific rules and scripts
# governing a one player human v. cpu game
class OnePlayer < Match
  def cpu_init
    puts "Hello #{@player_one.name}, my name is HAL.
If you're fine with calling me HAL, just press <return>.
If you'd like to call me something else,
type my new name and press <return>."
    @player_two = CPU.new
    @player_two.sets_token(@player_one)
    puts ''
    puts "Thanks for naming me #{@player_two.name}, #{@player_one.name}."
  end

  def init_players
    puts 'Player, please enter your name.'
    @player_one = Human.new
    puts ''
    @player_one.sets_token(@player_two)
    cpu_init
  end
end
