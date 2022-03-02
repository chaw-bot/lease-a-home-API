class Apartment < ApplicationRecord
  has_many :leases
  validates :name, :image, :maintenance_fee, :monthly_rent, :city, :reservation_expiry_date, :interior, presence: true
end
