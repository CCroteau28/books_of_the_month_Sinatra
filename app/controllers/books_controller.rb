class BooksController < ApplicationController
    
    get '/books' do
        @books = Book.all
        erb :'books/index'
    end

    get '/books/new' do
        @genres = Genre.all
        erb :'books/new'
    end

    get '/books/:id' do
        @book = Book.find(params[:id])
        erb :'/books/show'
    end

    get '/books/:id/edit' do
        @book = Book.find(params[:id])
        erb :'books/edit'
    end

    post '/books' do
        @book = Book.create(params[:book])
    if !params[:genre][:genre].empty?
        @book.genres << Genres.create(name: params[:genre][:name])
    if !params[:author][:name].empty?
        @book.authors << Author.create(params[:author])
    if !params[:title][:name].empty?
        @book.titles << Title.create(params[:title])
    end
    redirect "books/#{@book.id}"
    end

    patch '/books/:id' do
        @book = Book.find_by_id(params[:id])
        @book.update(params[:book])
        if !params[:genre][:genre].empty?
            @book.genre << Genre.create(name: params[:genre][:name])
        if !params[:author][:name].empty?
            @book.authors << Author.create(params[:author])
        if !params[:title][:name].empty?
            @book.titles << Title.create(params[:title])
        end
        redirect "books/#{@book.id}"
    end

    delete '/books/:id' do
        @book = Book.find(params[:id])
        @book.destroy
        redirect :'/books'
    end
end