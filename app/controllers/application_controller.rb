require './config/environment'
require 'sinatra/flash'


class ApplicationController < Sinatra::Base

  register Sinatra::Flash

  set :method_override, true

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, "auth_book_asdfadse"
    enable :sessions
  end

  get "/" do
    erb :'/login'
  end

get "/logout" do
  session.clear
  redirect "/login"
end


  helpers do
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
      !!session[:user_id]
    end

    # def login(username, password)
    #   if user = User.find_by(session[:user_id])
    #     session[:usernam
    #   else
    #     redirect '/login'
    #   end
    # end

    def logout!
      session.clear
    end
  end
end
