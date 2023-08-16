class Comment < ApplicationRecord
  include Visible
  belongs_to :article
  belongs_to :user
  has_many_attached :images
  VALID_STATUSES = ['public', 'private', 'archived']

  validates :status, inclusion: { in: VALID_STATUSES }

  def archived?
    status == 'archived'
  end
end
