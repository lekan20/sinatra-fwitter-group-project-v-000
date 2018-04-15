class UsersController < ApplicationController

  get '/signup' do #sign up the user, if a user isn't logged in
    if !logged_in?
      erb :"users/signup"
    else
      redirect '/tweets'
    end
  end

  post '/signup' do #create a new user with inputs or send them back to sign up page if any field is blank
    if params[:username].empty? || params[:email].empty? || params[:password].empty?
      redirect '/signup'
    else
      @user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
      session[:user_id] = @user.id
      redirect '/tweets'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'/users/login'
    else
      redirct '/tweets'
    end
  end


end
