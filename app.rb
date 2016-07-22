require("bundler/setup")
Bundler.require(:default)

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
  @brands = Brand.all
  erb :store
end

patch '/store/:id/name' do
  name = params.fetch('new_store')
  @store = Store.find(params.fetch('id'))
  @store.update({name: name})
  redirect("/store/".concat(@store.id().to_s()))
end

patch '/store/:id' do
  @store = Store.find(params.fetch('id'))
  brand = Brand.find(params.fetch 'brand')
  @store.brands.push(brand)
  redirect("/store/".concat(@store.id().to_s()))

end

delete '/store/:id' do
  @store = Store.find(params.fetch('id'))
  @store.delete
  redirect '/stores'
end

post '/brands' do
  name = params.fetch 'name'
  brand = Brand.create({name: name})
  redirect '/brands'
end

get '/brand/:id' do
  @stores = Store.all
  @brand = Brand.find(params.fetch('id'))
  erb :brand
end

patch '/brand/:id' do
  @brand = Brand.find(params.fetch('id'))
  store = Store.find(params.fetch 'store')
  @brand.stores.push(store)
  redirect("/brand/".concat(@brand.id().to_s()))
end

patch '/brand/:id/name' do
  name = params.fetch('new_brand')
  @brand = Brand.find(params.fetch('id'))
  @brand.update({name: name})
  redirect("/brand/".concat(@brand.id().to_s()))
end

delete '/brand/:id' do
  @brand = Brand.find(params.fetch('id'))
  @brand.delete
  redirect '/brands'
end
