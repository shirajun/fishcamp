class Item < ApplicationRecord
  belongs_to :user
  has_many   :items
  has_one_attached :image


  with_options presence:  true do
    validates :name, :text, :price, :image
  end
end
