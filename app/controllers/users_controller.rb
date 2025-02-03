# frozen_string_literal: true

require 'bcrypt'
require 'valid_email'

get '/login' do
  erb :"login/index"
end

post '/login' do
  if check_login(params[:email], params[:password], session)
    redirect '/'
  else
    redirect '/login'
  end
end

get '/register' do
  erb :"register/index"
end

post '/register' do
  if register_user(params[:firstname], params[:lastname], params[:email], params[:password], session)
    redirect '/login'
  else
    redirect '/register'
  end
end

get '/account' do
  @user = User.find_by(id: session[:user_id])

  erb :"account/index"
end

patch '/account' do
  @user = User.find_by(id: session[:user_id])

  if params.key?(:email)
    if BCrypt::Password.new(@user.password_digest) != params[:password_current]
      session[:error] = "Le mot de passe actuel que vous avez rentré n'est pas correct."
      redirect '/account'
    end

    if params[:password_new] == params[:password_validation]
      @user.update(
        email: params[:email],
        password_digest: BCrypt::Password.create(params[:password_new])
      )

      session.clear
      redirect '/account'
    end
  end

  if params.key?(:firstname)
    @user.update(
      firstname: params[:firstname],
      lastname: params[:lastname]
    )

    session[:user_name] = "#{@user.firstname} #{@user.lastname}"
    redirect '/account'
  end
end

get '/logout' do
  session.clear
  redirect '/login'
end

##############################

def check_login(email, password, session)
  @user = User.find_by_email(email)
  error = false

  error = true if @user.nil? || !ValidateEmail.valid?(email)

  if !error && BCrypt::Password.new(@user.password_digest) == password
    session[:user_id] = @user.id
    session[:user_name] = "#{@user.firstname} #{@user.lastname}"
    return true
  end

  session[:error] = 'Email et/ou mot de passe incorrect.' if error
  false
end

def register_user(firstname, lastname, email, password, session)
  unless ValidateEmail.valid?(email)
    session[:error] = 'Un problème est survenu, veuillez essayer plus tard'
    return false
  end

  current_date = Time.now.strftime('%Y-%m-%d %H:%M')

  true if User.create(
    firstname: firstname,
    lastname: lastname,
    email: email,
    password_digest: BCrypt::Password.create(password),
    created_at: current_date,
    updated_at: current_date
  )
end
