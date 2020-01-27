class ReviewsController < ApplicationController
    def new
        @book = Book.find(params[:book_id])
        @review = @book.reviews.new
    end

    def create
        @book = Book.find(params[:review][:book_id])
        @review = @book.reviews.create(review_params)
        if @review.save
            redirect_to book_path(@book)
        else
            render 'new'
        end
    end

    def edit
        @book = Book.find(params[:book_id])
        @review = @book.reviews.find(params[:id])
    end

    def update
        @book = Book.find(params[:review][:book_id])
        @review = @book.reviews.find(params[:id])
        if @review.update(review_params)
            redirect_to book_path(@book)
        else
            render 'edit'
        end
    end

    private
    def review_params
        params.require(:review).permit(:user_id,:review,:book_id)
    end

end
