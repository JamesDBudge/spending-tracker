require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('controllers/tags_controller.rb')
require_relative('controllers/merchants_controller.rb')
require_relative('controllers/transactions_controller.rb')
require_relative('models/budget.rb')

also_reload('../models/*')

  get '/' do
   @budget = Budget.find(1)
    erb(:index)
  end

  post '/updatebudget' do
    budget = Budget.new(params)
    budget.update
    redirect to '/'
  end
