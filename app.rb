require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  erb :index
end

get '/brands' do
  @brands = Brand.all
  erb :brands
end

get '/stores' do
  @stores = Store.all
  erb :stores
end

post '/stores' do
  name = params.fetch 'name'
  store = Store.create({name: name})
  redirect '/stores'
end

get '/store/:id' do
  @store = Store.find(params.fetch('id'))
  erb :store
end

delete '/store/:id' do
  @store = Store.find(params.fetch('id'))
  @store.delete
  redirect '/stores'
end
