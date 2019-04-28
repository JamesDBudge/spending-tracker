require( 'sinatra/contrib/all' )
require( 'sinatra' )
require('pry')
require_relative('../models/merchant.rb')

also_reload( '../models/*' )

get '/merchants' do
  @merchants = Merchant.all
  erb(:"merchants/index")
end

get '/merchants/new' do
  erb(:"merchants/new")
end

post '/merchants' do
  merchant = Merchant.new(params)
  merchant.save
  redirect to '/merchants'
end

post '/merchants/:id/delete' do
  Merchant.destroy(params[:id])
  redirect to '/merchants'
end

get '/merchants/:id' do
  @merchant = Merchant.find(params['id'].to_i)
  @transactions = Transaction.find_by_merchant(params['id'].to_i)
  erb(:"merchants/show")
end

get '/merchants/:id/edit' do
  @merchant = Merchant.find(params['id'].to_i)
  erb(:"merchants/edit")
end

post '/merchants/:id' do
  merchant = Merchant.new(params)
  merchant.update
  redirect to '/merchants'
end
