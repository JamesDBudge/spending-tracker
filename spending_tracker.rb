require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/tag_controller.rb')
require_relative('controllers/merchant_controller.rb')
require_relative('controllers/transaction_controller.rb')

get '/' do
  erb(:index)
end
