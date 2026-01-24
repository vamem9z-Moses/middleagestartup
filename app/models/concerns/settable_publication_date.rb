module SettablePublicationDate
  extend ActiveSupport::Concern

  included do
    before_create :create_publication_date
    before_update :update_publication_date
  end

  private

    # Set the publication date when the published status changes
    # without having to set the publication date explicitly
    def update_publication_date
      if self.published_change
        self.publication_date = Time.now
      end
    end

    def create_publication_date
      if self.published && !self.publication_date
        self.publication_date = Time.now
      end
    end
end
