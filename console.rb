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


bounty1.save
bounty2.save

bounty1.name = 'Jaba The Hutt'
bounty1.update()
