class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :order
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :area
  belongs_to_active_hash :day

  validates :image, :name, :explain, :category, :status, :shipping_fee, :area, :day, :price, presence: true
  validates :category_id, :status_id, :shipping_fee_id, :area_id, :day_id, numericality: { other_than: 1 } 
  validates :price, inclusion: { in: 300..9999999 }, format: { with: /\A[a-zA-Z0-9]+\z/ }

end
