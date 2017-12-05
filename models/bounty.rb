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

  def update()
    db = PG.connect({dbname: 'space_cowboys', host: 'localhost'})
    sql = "UPDATE bounties SET(name, bounty_value, homeworld, favourite_weapon) = ($1, $2, $3, $4)
    WHERE id = $5"
    values = [@name, @bounty_value, @homeworld, @favourite_weapon, @id]
    db.prepare("update", sql)
    orders = db.exec_prepared("update", values)
    db.close()
  end

  def self.delete_all()
    db = PG.connect({dbname: 'space_cowboys', host: 'localhost'})
    sql = "DELETE FROM bounties"
    db.prepare("del_all", sql)
    db.exec_prepared("del_all")
    db.close()
  end


  def delete()
    db = PG.connect({dbname: 'space_cowboys', host: 'localhost'})
    sql = "DELETE FROM bounties
    WHERE id = $1"
    values = [@id]
    db.prepare("del", sql)
    bounties = db.exec_prepared("del", values)
    db.close()
  end

  def self.find(bounty)
    db = PG.connect({dbname: 'space_cowboys', host: 'localhost'})
    sql = "SELECT * FROM bounties
    WHERE id = $1"
    values = [bounty.id]
    db.prepare("single", sql)
    bounty = db.exec_prepared("single", values)
    db.close()
    return bounty.map {|bounty| Bounty.new(bounty)}
  end

end
