class Post < ApplicationRecord
  include Sluggable
  include SettablePublicationDate
  include Taggable

  has_rich_text :body
  belongs_to :author
  belongs_to :featured_image, optional: true

  validates :title, presence: true
  validates :title, uniqueness: { case_sensitive: false }
  validates :body, presence: true
end
