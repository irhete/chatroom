class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation
  has_secure_password

  has_many :owned_rooms, :class_name => "Room", :foreign_key => "owner_id"
  has_and_belongs_to_many :rooms, :class_name => "Room", :foreign_key => "member_id", :association_foreign_key => "room_id"
  has_many :posts

  validates :name, presence: true, length: { minimum: 6 }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
end
