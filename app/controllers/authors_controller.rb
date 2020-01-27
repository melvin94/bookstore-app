class AuthorsController < ApplicationController
    def index
        @authors = Author.all
    end

    def show
        @author = Author.find(params[:id])
        @books = @author.books.all
    end

    def new
        session[:return_to] ||= request.referer
        @author = Author.new
        @error = false
        if params[:author_exists]
            @error = true
        end
    end

    def create
        if Author.already_has_author(author_params[:author])
            redirect_to new_author_url(author_exists: true)
        else
            @author = Author.create(author_params)
            if @author.save
                redirect_to session.delete(:return_to)
            else
                render 'new'
            end
        end
    end

    def edit
        @author = Author.find(params[:id])
        @error = false
        if params[:author_exists]
            @error = true
        end
    end

    def update
        if Author.already_has_author(author_params[:author])
            redirect_to edit_author_url(author_exists: true)        
        else
            @author = Author.find(params[:id])
            if @author.update(author_params)
                redirect_to '/authors'
            else
                render 'edit'
            end
        end
    end

    private
    def author_params
        params.require(:author).permit(:author)
    end
end
