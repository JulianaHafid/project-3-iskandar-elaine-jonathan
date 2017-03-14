class Event < ApplicationRecord
  mount_uploader :image_url, PictureUploader
  has_many :requests
  belongs_to :user

  validates_presence_of :name, :location, :date, :time, :image_url, :user_id
end
