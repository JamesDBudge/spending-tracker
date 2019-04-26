require( 'sinatra/contrib/all' )
require( 'sinatra' )
require('pry')
require_relative('../models/transaction.rb')
require_relative('../models/merchant.rb')
require_relative('../models/tag.rb')

also_reload( '../models/*' )

get '/transactions' do
  @transactions = Transaction.all()
  erb(:"transactions/index")
end

get '/transactions/new' do
  @tags = Tag.all()
  @merchants = Merchant.all()
  @transactions = Transaction.all()
  erb(:"transactions/new")
end

post '/transactions' do
  transaction = Transaction.new(params)
  transaction.save
  redirect to '/transactions'
end

post '/transactions/:id/delete' do
  Transaction.destroy(params[:id])
  redirect to '/transactions'
end

get '/transactions/:id' do
  @transaction = Transaction.find(params['id'].to_i)
  erb(:"transactions/show")
end

get '/transactions/:id/edit' do
  @transaction = Transaction.find(params['id'].to_i)
  @merchants = Merchant.all()
  @tags = Tag.all()
  erb(:"transactions/edit")
end

post '/transactions/:id' do
  transaction = Transaction.new(params)
  transaction.update
  redirect to '/transactions'
end
