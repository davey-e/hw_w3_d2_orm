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


  def save()
    db = PG.connect({dbname: 'space_cowboys', host: 'localhost'})
    sql = "INSERT INTO bounties (name, bounty_value, homeworld, favourite_weapon)
            VALUES($1, $2, $3, $4)
            RETURNING *"
    values = [@name, @bounty_value, @homeworld, @favourite_weapon]
    db.prepare("save", sql)
    @id = db.exec_prepared("save", values)[0]['id'].to_i
    db.close()
  end

  # def update
  #
  # end

end
