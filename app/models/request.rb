class Request < ApplicationRecord
  belongs_to :user
  # has_many_and_belongs_to
  belongs_to :event
end
