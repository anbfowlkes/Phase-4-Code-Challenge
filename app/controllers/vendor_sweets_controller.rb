class VendorSweetsController < ApplicationController

    def create
        vendor_sweet = VendorSweet.new(vendor_sweet_params)
        if vendor_sweet.save
            sweet = vendor_sweet.sweet
            name = sweet[:name]
            render json: {id: vendor_sweet[:id], name: name, price: vendor_sweet[:price]}, status: 201
        else
            render json: { errors: vendor_sweet.errors.full_messages }, status: 422
        end
    end
    
    def destroy
        vendor_sweet = VendorSweet.find_by(id: params[:id])
        if vendor_sweet
            vendor_sweet.destroy
            render json: {}, status: 200
        else
            render json: { error: "VendorSweet not found" }, status: 404
        end
    end

    private

    def vendor_sweet_params
        params.permit(:price, :vendor_id, :sweet_id)
    end

end
