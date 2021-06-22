require './config/environment'
require 'sinatra/flash'


class UsersController < ApplicationController

    get '/signup' do
        erb :'/users/signup'
    end

    get '/login' do 
      erb :'/users/login'
  end

    post '/signup' do
        @user = User.find_by(:username => params[:username])
        if params[:username] == "" || params[:password] == ""
            redirect to "/failure"
        else
          if @user 
            flash[:message] = "Seems like this username is in use. Please Try Again"
            redirect "/signup"
          else
            user = User.create(:username => params[:username], :password => params[:password])
            session[:user_id] = user.id
            redirect to "/books"
          end
        end
      end

    post '/login' do
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
          session["user_id"] = @user.id 
          redirect '/books'
        else
          erb :'/failure'
        end
      end
    
      get "/failure" do
        erb :failure
      end
    
      get "/logout" do
        logout!
        redirect "/login"
      end
    end
      