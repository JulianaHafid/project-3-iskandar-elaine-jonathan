class Request < ApplicationRecord
  # has_many_and_belongs_to
  belongs_to :event
  belongs_to :requestor, class_name: 'User'
  belongs_to :standin, class_name: 'User', optional: true
end
