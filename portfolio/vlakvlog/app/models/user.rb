class User < ApplicationRecord
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:github]

  after_create :assign_default_role

  has_many :articles
  has_many :comments
    def assign_default_role
    self.add_role(:logged_in) if self.roles.blank?
  end
end
