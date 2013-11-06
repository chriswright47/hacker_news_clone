class User < ActiveRecord::Base
  validates :email,:name, :uniqueness => true
  # validates :email, :format => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  has_many :posts
  has_many :comments
  has_many :comment_votes
  has_many :post_votes
end
