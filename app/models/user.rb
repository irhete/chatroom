class User < ActiveRecord::Base
  attr_accessible :name, :passwordhash
  has_many :owned_rooms, :class_name => "Room", :foreign_key => "owner_id"
  has_and_belongs_to_many :rooms, :class_name => "Room", :foreign_key => "member_id", :association_foreign_key => "room_id"
  has_many :posts
end
