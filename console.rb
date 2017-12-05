require('pry-byebug')
require_relative('./models/bounty')

bounty1 = Bounty.new({
  'name' => 'Jabba',
  'bounty_value' => '1000',
  'homeworld' => 'Tatooine',
  'favourite_weapon' => 'Axe'
  })

bounty2 = Bounty.new({
  'name' => 'Luke',
  'bounty_value' => '30',
  'homeworld' => 'Tatooine',
  'favourite_weapon' => 'Lightsaber'
  })

bounty3 = Bounty.new({
    'name' => 'Han',
    'bounty_value' => '500',
    'homeworld' => 'Corellia',
    'favourite_weapon' => 'Blaster'
    })

Bounty.delete_all()

bounty1.save
bounty2.save
bounty3.save

bounty1.name = 'Jabba The Hutt'
bounty1.update()

bounty2.delete

find_result = Bounty.find_by_id(53)
p find_result

find_result = Bounty.find_by_name('Han')
p find_result

binding.pry
nil
