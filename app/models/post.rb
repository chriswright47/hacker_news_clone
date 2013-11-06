class Post < ActiveRecord::Base
  validates :body, :presence => true
  belongs_to :user
  has_many :comments
  has_many :post_votes

end
