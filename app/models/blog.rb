class Blog < ApplicationRecord
  belongs_to :user
  has_many  :messages
  has_one_attached :image

  with_options presence:  true do
    validates :title, :text
  end
end
