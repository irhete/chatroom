class Post < ActiveRecord::Base
  belongs_to :room
  attr_accessible :body, :username
end
