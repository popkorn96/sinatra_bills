require './config/environment'

class ApplicationController < Sinatra::Base
  

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get "/" do
    redirect "/index"
  end
  get "/welcome" do 
    erb :welcome
  end
  get "/index" do 
    @session = session
    erb :index
  end
  helpers do
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    def is_logged_in?
      !!current_user
    end
  end
  get "/about" do
    erb :about_bills_app
  end

  private
  def redirect_if_not_authorized
    if current_user.id != @bill.user_id
      redirect "/bills"
    end
  end

end
