CREATE TABLE users (
  id int(100) NOT NULL AUTO_INCREMENT,
  name varchar(100) NOT NULL,
  email varchar(100) NOT NULL,
  password varchar(100) NOT NULL,
  user_type varchar(20) NOT NULL DEFAULT 'user',
  PRIMARY KEY(id) 
);

CREATE TABLE products (
  id int(100) NOT NULL AUTO_INCREMENT,
  name varchar(100) NOT NULL,
  details varchar(500) NOT NULL,
  price int(100) NOT NULL,
  image varchar(100) NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE message (
  id int(100) NOT NULL AUTO_INCREMENT,
  user_id int(100) NOT NULL,
  number varchar(12) NOT NULL,
  message varchar(500) NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY(user_id) references users(id)
  ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE cart (
  id int(100) NOT NULL AUTO_INCREMENT,
  user_id int(100) NOT NULL,
  pid int(100) NOT NULL,
  quantity int(100) NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY(user_id) references users(id)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY(pid) references products(id)
  ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE wishlist (
  id int(100) NOT NULL AUTO_INCREMENT,
  user_id int(100) NOT NULL,
  pid int(100) NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY(user_id) references users(id)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY(pid) references products(id)
  ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE orders (
  id int(100) NOT NULL AUTO_INCREMENT,
  user_id int(100) NOT NULL,
  number varchar(12) NOT NULL, 
  method varchar(50) NOT NULL,
  address varchar(500) NOT NULL,
  total_price int(100) NOT NULL,
  placed_on varchar(50) NOT NULL,
  payment_status varchar(20) NOT NULL DEFAULT 'pending',
  PRIMARY KEY(id),
  FOREIGN KEY(user_id) references users(id)
  ON DELETE CASCADE ON UPDATE CASCADE
);

create TABLE orderitem (
  id int(100) NOT NULL AUTO_INCREMENT,
  oid int(100) NOT NULL,
  itemid int(100) NOT NULL,
  qty int(100) NOT NULL,
  tprice int(100) NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY(oid) references orders(id)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY(itemid) references products(id)
  ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO products (name, details, price, image) VALUES
('Pink Rose Bouquet', 'Our Pink Rose Bouquet features a delicate arrangement of handpicked pink roses, symbolizing grace and appreciation. Perfect for expressing admiration or adding a touch of elegance to any occasion.', 12, 'pink roses.jpg'),
('Cottage Rose Bouquet', 'Capture the charm of a countryside garden with our Cottage Rose Bouquet. Bursting with rustic appeal and sweet fragrance, this bouquet brings warmth and nostalgia to any setting.', 15, 'cottage rose.jpg'),
('Lavender Rose Bouquet', 'Indulge in the enchanting beauty of our Lavender Rose Bouquet. Each bloom radiates elegance and beauty, making it an ideal choice for adding a touch of sophistication to any event.', 13, 'lavender rose.jpg'),
('Yellow Tulip Bouquet', 'Spread sunshine and joy with our Yellow Tulip Bouquet. Vibrant and graceful, these tulips are sure to brighten anyone\'s day and lift spirits with their cheerful color.', 14, 'yellow tulipa.jpg'),
('Red Tulip Bouquet', 'Declare your love with our Red Tulip Bouquet. Each stem represents deep passion and affection, making it a timeless choice for expressing heartfelt emotions.', 11, 'red tulipa.jpg'),
('Pink Blossom Bouquet', 'Our Pink Blossom Bouquet is a delightful display of delicate blooms and lush greenery. Perfect for brightening any space or sending a message of joy and appreciation.', 15, 'pink bouquet.jpg'),
('Pink Queen Rose Bouquet', 'Treat yourself or someone special to the luxury of our Pink Queen Rose Bouquet. Majestic and regal, these blooms exude sophistication and make a statement of elegance.', 24, 'pink queen rose.jpg');