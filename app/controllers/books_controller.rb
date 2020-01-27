class BooksController < ApplicationController
    def index
        @books = Book.all
    end

    def show
        @book = Book.find(params[:id])
    end

    def new
        @book = Book.new
    end

    def create
        @book = current_user.books.create(book_params)
        if @book.save
            redirect_to '/profile/index'
        else
            render 'new'
        end
    end

    def edit
        @book = Book.find(params[:id])
    end

    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
            redirect_to '/profile/index'
        else
            render 'edit'
        end
    end

    private
    def book_params
        params.require(:book).permit(:name,:author_id,:genre_id,:description,:published_date)
    end

end
