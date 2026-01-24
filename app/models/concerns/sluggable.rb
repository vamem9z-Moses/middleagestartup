module Sluggable
  extend ActiveSupport::Concern

  included do
    after_validation :set_slug, only: [ :create, :update ]
  end

  def to_param
    "#{id}-#{slug}"
  end

  private
    # Set the slug based on the title
    def set_slug
      self.slug = title.to_s.parameterize
    end
end
