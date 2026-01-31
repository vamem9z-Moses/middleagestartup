class Author < ApplicationRecord
  has_one_attached :avatar
  after_validation :set_name, only: [ :create, :update ]
  has_many :posts, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true
  validates :blurb, presence: true


  private
  def set_name
    self.name = self.first_name + " " + self.last_name
  end
end
