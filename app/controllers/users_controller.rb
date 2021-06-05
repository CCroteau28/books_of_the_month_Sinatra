class UserController < ApplicationController

    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
        user = User.new(params)
        if params[:username] == "" || params[:password] == ""
            redirect to "/failure"
          else
            user = User.create(:username => params[:username], :password => params[:password])
      
            redirect to "/login"
          end
        end
    end

    get '/login' do 
        erb :'/users/login'
    end

    post '/login' do
        @user = User.find_by(username: params["username"], password: params["password"])
        if @user
          session["user_id"] = @user.id 
          redirect '/books'
        else
          erb :error
        end
      end