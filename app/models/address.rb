class Address < ActiveRecord::Base
  belongs_to :user
  belongs_to :street
  belongs_to :district
  belongs_to :city
  belongs_to :province

  def self.find_default_address user_id
    current_address = self.eager_load(:street).eager_load(:district).eager_load(:province).eager_load(:city).find_by :user_id=>user_id,:is_default=>true
    address_map = current_address.attributes
    address_map[:street]  = current_address.street.name
    address_map[:district]  = current_address.district.name
    address_map[:province]  = current_address.province.name
    address_map[:city]  = current_address.city.name
    address_map
  end

  def self.find_address address_id
    current_address = self.eager_load(:street).eager_load(:district).eager_load(:province).eager_load(:city).find_by :id=>address_id

    nil if current_address.nil?

    address_map = current_address.attributes
    address_map[:street]  = current_address.street.name
    address_map[:district]  = current_address.district.name
    address_map[:province]  = current_address.province.name
    address_map[:city]  = current_address.city.name
    address_map
  end
end
