class Event < ApplicationRecord
  mount_uploader :image_url, PictureUploader
  has_many :requests
  belongs_to :user

  validates_presence_of :name, :location, :date, :time, :image_url, :user_id
  # validate :val_event_date
  #
  #
  # def val_event_date
  #   if date <= (Date.today() + 2.days)
  #     errors.add(:date, "Date of the event needs to be at least 2 days in advance")
  #   end
  # end




end
