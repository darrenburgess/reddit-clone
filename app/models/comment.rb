class Comment < ActiveRecord::Base
  belongs_to :author, class_name: :user, foreign_key: 'user_id'
  belongs_to :post
end
