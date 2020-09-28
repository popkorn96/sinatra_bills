class UsersController < ApplicationController
  # GET: /users
  get "/users" do
    erb :"/users/index.html"
  end

  # POST: /users
  post "/users" do
    redirect "/users"
  end

  get "/signup" do
    erb :"/users/signup"
  end

  post "/signup" do
    if params[:username] == "" || params[:password] == ""
      redirect "/signup"
    else 
      @user = User.new(username: params[:username], password: params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect "/bills"
    end
  end

  get "/login" do 
    if !is_logged_in?
      erb :"/users/login"
    else
      redirect "/bills"
    end
  end

  post "/login" do 
    # @session = session
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/bills"
    end
    redirect "/login"
  end

  get "/users/:id" do
  end

  get "/user/:id/calendar" do
    @bills = current_user.bills
    if is_logged_in?
      @user = current_user
      erb :"bills/calendar"
    else
      redirect "/login"
    end
  end

  delete "/users/:id/delete" do
  end
  get "/logout" do
    if !is_logged_in?
        redirect "/login"
    else
        session.clear
        redirect "/login"
    end
  end
  
end
