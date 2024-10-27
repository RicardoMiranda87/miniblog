class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  enum role: { guest: 0, author: 1 }

  before_create :set_default_role

  private

  def set_default_role
    self.role ||= :guest
  end
end
