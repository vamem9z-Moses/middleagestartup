class FeaturedImage < ApplicationRecord
  has_one_attached :image
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitve: false }
  validates :alt_text, presence: true
  validates :image, presence: true
end
