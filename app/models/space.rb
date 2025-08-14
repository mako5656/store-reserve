class Space < ApplicationRecord
  belongs_to :owners
  has_one_attached :image
end
