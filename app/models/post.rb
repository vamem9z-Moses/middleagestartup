class Post < ApplicationRecord
  include Sluggable
  include SettablePublicationDate

  has_rich_text :body

  validates :title, presence: true
  validates :title, uniqueness: { case_sensitive: false }
  validates :body, presence: true
end
