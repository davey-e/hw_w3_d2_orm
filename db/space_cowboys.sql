DROP TABLE bounties;

CREATE TABLE bounties(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  bounty_value INT2,
  homeworld VARCHAR(255),
  favourite_weapon VARCHAR(255)
);
