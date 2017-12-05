require('pg')

class Bounty

  attr_accessor :name, :bounty_value, :homeworld, :favourite_weapon
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @bounty_value = options['bounty_value'].to_i
    @homeworld = options['homeworld']
    @favourite_weapon = options['favourite_weapon']
  end

end
