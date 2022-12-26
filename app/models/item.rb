class Item < ApplicationRecord
  validates :image_path, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :description, presence: true
end
