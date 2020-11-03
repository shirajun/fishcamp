class Purchase < ApplicationRecord
  belongs_to :item
  has_one :order


end
