# frozen_string_literal: true

get '/meals' do
  @meal_types = MealType.all.order(:id)
  @meals = Meal.where(user_id: session[:user_id], created_at: Date.today.beginning_of_day..Date.today.end_of_day)

  @kcal = @meals.nil? ? 0 : (@meals.map { |m| m.product.kcal * (m.portion / 100) }).sum
  @proteins = @meals.nil? ? 0 : (@meals.map { |m| m.product.proteins * (m.portion / 100) }).sum
  @carbohydrates = @meals.nil? ? 0 : (@meals.map { |m| m.product.carbohydrates * (m.portion / 100) }).sum
  @fat = @meals.nil? ? 0 : (@meals.map { |m| m.product.fat * (m.portion / 100) }).sum

  erb :"meals/index"
end

get '/meals/new' do
  @meal_types = MealType.all.order(:id)
  @products = Product.all

  erb :"meals/new"
end

get '/meals/track' do
  meals = Meal.where(user_id: session[:user_id]).order(:created_at)
  @dates = meals.map { |meal| meal.created_at.to_date }.uniq.to_json

  meals = meals.group_by { |meal| meal.created_at.to_date }
  @kcals = []

  meals.each do |(_key, meal)|
    @kcals.push((meal.map { |m| m.product.kcal * (m.portion / 100) }).sum)
  end

  @kcals = @kcals.to_json

  erb :"meals/track"
end

post '/meals' do
  products = params[:products].reject { |_key, value| value['check'].nil? }

  products.each do |(key, p)|
    Meal.create(
      portion: p['portion'],
      product: Product.find_by(id: key),
      meal_type: MealType.find_by(id: params[:meal_type]),
      user: User.find_by(id: session[:user_id])
    )
  end

  redirect '/meals'
end

delete '/meals/:id' do |id|
  redirect '/meals' if Meal.destroy_by(id: id)
end
