# frozen_string_literal: true

get '/products' do
  @products = Product.all

  erb :"products/index"
end

get '/products/new' do
  @product_types = ProductType.all

  erb :"products/new"
end

post '/products' do
  if store_product(params[:name], params[:product_type], params[:kcal], params[:fat], params[:proteins],
                   params[:carbohydrates])
    redirect '/products'
  else
    redirect '/products/new'
  end
end

delete '/products/:id' do |id|
  redirect '/products' if Product.destroy_by(id: id)
end

#######################################

def store_product(name, product_type, kcal, fat, proteins, carbohydrates)
  true if Product.create(
    name: name,
    product_type_id: product_type.to_i,
    kcal: kcal.to_i,
    fat: fat.to_i,
    proteins: proteins.to_i,
    carbohydrates: carbohydrates.to_i
  )
end
