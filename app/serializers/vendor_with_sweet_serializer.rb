class VendorWithSweetSerializer < ActiveModel::Serializer
  attributes :id, :name, :vendor_sweets

  has_many :vendor_sweets
  #including this line makes my vendor_sweet serializer apply

  # def show_vendor_sweets
  #   self.object.sweets
  # end

  # has_many :sweets, serializer: VendorSweetSerializer
end
