require_relative('../models/tag.rb')
require_relative('../models/transaction.rb')
require_relative('../models/merchant.rb')

tag1 = Tag.new({'tag' => 'groceries'})
tag1.save

merchant1 = Merchant.new({'name' => 'ASDA'})
merchant1.save

transaction1 = Transaction.new({
  "tag_id" => tag1.id,
  "merchant_id" => merchant1.id,
  "spent" => 22
  })
transaction1.save
