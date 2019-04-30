require( 'sinatra/contrib/all' )
require( 'sinatra' )
require('pry')
require_relative('../models/tag.rb')

also_reload( '../models/*' )

get '/tags' do
  @tags = Tag.all
  erb(:"tags/index")
end

get '/tags/new' do
  erb(:"tags/new")
end

post '/tags' do
  tag = Tag.new(params)
  tag.save
  redirect to '/tags'
end

post '/tags/:id/delete' do
  Tag.destroy(params[:id])
  redirect to '/tags'
end

get '/tags/:id' do
  @tag = Tag.find(params['id'].to_i)
  @transactions = Transaction.find_by_column(params['id'].to_i, "tag_id")
  erb(:"tags/show")
end

get '/tags/:id/edit' do
  @tag = Tag.find(params['id'].to_i)
  erb(:"tags/edit")
end

post '/tags/:id' do
  tag = Tag.new(params)
  tag.update
  redirect to '/tags'
end
