class PurchasesController < ApplicationController
    def new
        @purchase = current_user.purchases.new
    end

    def create
        @purchase = current_user.purchases.create(purchase_params)
        @purchase.save
        redirect_to '/profile/index'
    end

    private
    def purchase_params
        params.require(:purchase).permit(:book_id)
    end
end
