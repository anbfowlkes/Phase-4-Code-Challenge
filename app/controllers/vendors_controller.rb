class VendorsController < ApplicationController
    def index
        render json: Vendor.all, status: 200
    end

    def show
        vendor = Vendor.find_by(id: params[:id])
        if vendor
            render json: vendor, serializer: VendorWithSweetSerializer, status: 200
        else
            render json: { error: "Vendor not found" }, status: 404
        end
    end
end
