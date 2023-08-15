class Article < ApplicationRecord
  include Visible
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many_attached :images
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10}

end
