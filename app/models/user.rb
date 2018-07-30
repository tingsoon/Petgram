class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  acts_as_voter

  validates :user_name, presence: true, length: { minimum: 4, maximum: 16 }
  validates :user_id, :notified_by_id, :post_id, :identifier, :notice_type, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
  
  mount_uploader :avatar, ImageUploader
end
