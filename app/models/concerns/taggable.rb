module Taggable
  extend ActiveSupport::Concern

  included do
    has_and_belongs_to_many :tags
  end

  def tag_names
    self.tags.map(&:name)
  end
end
