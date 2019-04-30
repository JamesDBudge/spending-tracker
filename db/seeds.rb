require_relative('../models/tag.rb')
require_relative('../models/transaction.rb')
require_relative('../models/merchant.rb')

Transaction.delete_all()
Tag.delete_all()
Merchant.delete_all()

tag1 = Tag.new({'tag' => 'groceries'})
tag1.save
tag2 = Tag.new({'tag' => 'breakfast'})
tag2.save
tag3 = Tag.new({'tag' => 'lunch'})
tag3.save
tag4 = Tag.new({'tag' => 'dinner'})
tag4.save
tag5 = Tag.new({'tag' => 'drinks'})
tag5.save
tag6 = Tag.new({'tag' => 'movies'})
tag6.save

merchant1 = Merchant.new({'name' => 'ASDA'})
merchant1.save
merchant2 = Merchant.new({'name' => 'Tesco'})
merchant2.save
merchant3 = Merchant.new({'name' => 'Sainsburys'})
merchant3.save
merchant4 = Merchant.new({'name' => 'Morrissons'})
merchant4.save
merchant5 = Merchant.new({'name' => 'Greggs'})
merchant5.save
merchant6 = Merchant.new({'name' => 'Pret a Manger'})
merchant6.save

transaction1 = Transaction.new({
  "tag_id" => tag1.id,
  "merchant_id" => merchant1.id,
  "spent" => 22
  })
transaction1.save
transaction2 = Transaction.new({
  "tag_id" => tag1.id,
  "merchant_id" => merchant2.id,
  "spent" => 31
  })
transaction2.save
transaction3 = Transaction.new({
  "tag_id" => tag3.id,
  "merchant_id" => merchant5.id,
  "spent" => 4
  })
transaction3.save
transaction4 = Transaction.new({
  "tag_id" => tag4.id,
  "merchant_id" => merchant6.id,
  "spent" => 10
  })
transaction4.save
transaction5 = Transaction.new({
  "tag_id" => tag1.id,
  "merchant_id" => merchant1.id,
  "spent" => 60
  })
transaction5.save
transaction6 = Transaction.new({
  "tag_id" => tag3.id,
  "merchant_id" => merchant3.id,
  "spent" => 13
  })
transaction6.save
transaction7 = Transaction.new({
  "tag_id" => tag4.id,
  "merchant_id" => merchant4.id,
  "spent" => 22
  })
transaction7.save
