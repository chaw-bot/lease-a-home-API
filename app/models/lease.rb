class Lease < ApplicationRecord
  validates :user_id, presence: true
  validates :apartment_id, presence: true

  validates :from, presence: true
  validates :to, presence: true

  validates :from, comparison: { less_than: :to }
  validates :to, comparison: { greater_than: :from }

  belongs_to :user
  belongs_to :apartment
end
