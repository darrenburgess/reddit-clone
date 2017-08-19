class Category < ActiveRecord::Base
  has_many :category_post
  has_many :posts, through: :category_posts

  validates :name, presence: true
end
