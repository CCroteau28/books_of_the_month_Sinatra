require './config/environment'

class BooksController < ApplicationController
    
    get '/' do
        redirect '/login'
    end

    get '/books' do
        if !logged_in?
            redirect '/login'
        end
        @books = Book.all
        erb :'/books/index'
    end

    get '/books/new' do
        if !logged_in?
            redirect '/login'
        end
        erb :'/books/new'
    end

    get '/books/:id' do
        if !logged_in?
            redirect '/login'
        end
        @book = Book.find(params[:id])
        erb :'/books/show'
    end

    get '/books/:id/edit' do
        if !logged_in?
            redirect '/login'
        end
        @book = Book.find_by(:id => params[:id])
        erb :'/books/edit'
    end

     post '/books' do
        if !logged_in?
            redirect '/login'
        end
        @book = Book.new(params)
        @book.user_id = session[:user_id]
        @book.save
	    redirect "books/#{@book.id}"
    end

    patch '/books/:id' do
        if !logged_in?
            redirect '/login'
        end
        @book = Book.find(params[:id])
        @book.update(params[:book])
        redirect "books/#{@book.id}"
    end

    delete '/books/:id' do
        if !logged_in?
            redirect '/login'
        end
        @book = Book.find_by_id(params[:id])
        @book.destroy
    redirect :'/books'
    end
end