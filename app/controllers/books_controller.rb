require './config/environment'

class BooksController < ApplicationController
    
    get '/' do
        redirect '/login'
    end

    get '/books' do
        if logged_in?
        @books = Book.all
        erb :'/books/index'
        else
            redirect '/login'
        end
    end

    get '/books/new' do
        erb :'/books/new'
    end

    get '/books/:id' do
        @book = Book.find(params[:id])
        erb :'/books/show'
    end

    get '/books/:id/edit' do
        @book = Book.find_by(:id => params[:id])
        @user = current_user.books.find_by(:id => params[:id])
        if current_user == @book.user
         erb :'books/edit'
        else
            erb '/failure'
        end
    end

     post '/books' do
        @book = Book.new(params)
        @book.user_id = session[:user_id]
        @book.save
	    redirect "books/#{@book.id}"
    end

    patch '/books/:id' do
        @book = Book.find(params[:id])
        @book.update(params[:book])
        redirect "books/#{@book.id}"
    end

    delete '/books/:id' do
        @book = Book.find_by_id(params[:id])
        @book.destroy
    redirect :'/books'
    end
end
