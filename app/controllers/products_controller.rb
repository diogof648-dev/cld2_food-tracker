# frozen_string_literal: true

get '/products' do
  @products = Product.where(active: 1)

  erb :"products/index"
end

get '/products/new' do
  @product_types = ProductType.all

  erb :"products/new"
end

post '/products' do
  if store_product(params)
    redirect '/products'
  else
    redirect '/products/new'
  end
end

get '/products/:id/edit' do |id|
  @product = Product.find_by(id: id)
  @product_types = ProductType.all

  erb :"products/edit"
end

patch '/products/:id' do |id|
  if update_product(id, params)
    redirect '/products'
  else
    redirect "/products/#{id}/edit"
  end
end

delete '/products/:id' do |id|
  redirect '/products' if Product.find_by(id: id).update(active: 0)
end

#######################################

def store_product(params)
  image_path = store_image(params[:image])

  true if Product.create(
    name: params[:name],
    product_type_id: params[:product_type].to_i,
    kcal: params[:kcal].to_i,
    fat: params[:fat].to_i,
    proteins: params[:proteins].to_i,
    carbohydrates: params[:carbohydrates].to_i,
    image: image_path
  )
end

def update_product(id, params)
  product = Product.find_by(id: id)
  image_path = store_image(params[:image])

  puts image_path = product.image if image_path.nil?

  true if product.update(
    name: params[:name],
    product_type_id: params[:product_type].to_i,
    kcal: params[:kcal].to_i,
    fat: params[:fat].to_i,
    proteins: params[:proteins].to_i,
    carbohydrates: params[:carbohydrates].to_i,
    image: image_path
  )
end

def store_image(image)
  puts image
  return nil if image.nil? || !image.is_a?(Sinatra::IndifferentHash) || !image[:type].start_with?('image/')

  FileUtils.mkdir_p('public/images') unless Dir.exist?('public/images')

  unless image.nil?
    image_type = image[:type].delete_prefix('image/')
    image_name = "product_#{Dir.entries('public/images').size}.#{image_type}"
    tempfile = image[:tempfile]
    final_path = "public/images/#{image_name}"
    FileUtils.cp(tempfile.path, final_path)
  end

  final_path
end
