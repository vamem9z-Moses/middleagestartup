class Tag < ApplicationRecord
  has_and_belongs_to_many :posts
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }

  def to_param
    name
  end
end
