class GenresController < ApplicationController
    def index
        @genres = Genre.all
    end

    def show
        @genre = Genre.find(params[:id])
        @books = @genre.books.all
    end

    def new
        @genre = Genre.new
        @error = false
        if params[:genre_exists]
            @error = true
        end
    end

    def create
        if Genre.already_has_genre(genre_params[:name])
            redirect_to new_genre_url(genre_exists: true)
        else
            @genre = Genre.create(genre_params)
            if @genre.save
                redirect_to '/books/new'
            else
                render 'new'
            end
        end
    end

    def edit
        @genre = Genre.find(params[:id])
        @error = false
        if params[:genre_exists]
            @error = true
        end
    end

    def update
        if Genre.already_has_genre(genre_params[:name])
            redirect_to edit_genre_url(genre_exists: true)
        else
            @genre = Genre.find(params[:id])
            if @genre.update(genre_params)
                redirect_to '/genres'
            else
                render 'new'
            end
        end
    end

    private
    def genre_params
        params.require(:genre).permit(:name)
    end
end
