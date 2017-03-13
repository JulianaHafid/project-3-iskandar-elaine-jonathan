class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :events
  has_many :requests, class_name: 'Request', foreign_key:'requestor_id'
  has_many :standin, class_name: 'Request', foreign_key:'standin_id'
  has_many :requestors, through: :requests, source: :requestor
  has_many :standins, through: :standin, source: :standin

end
