class Event < ApplicationRecord
  mount_uploader :image_url, PictureUploader
  has_many :requests
  belongs_to :user
end
