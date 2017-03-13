class Event < ApplicationRecord
  # before_filter :authenticate_user!, only: [:new, :edit, :update, :destroy]
  mount_uploader :image_url, PictureUploader
  has_many :requests
  belongs_to :user
end
