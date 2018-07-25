class Post < ApplicationRecord
    validates :user_id, presence: true
    mount_uploader :image, ImageUploader
    belongs_to :user
end
