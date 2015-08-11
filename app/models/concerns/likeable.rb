module Likeable
  extend ActiveSupport::Concern

  included do
    has_many :likes, :as => :likeable, :dependent => :destroy
  end


  # Return true if a user has liked a particular post
  def liked_by?(user)
    self.likes.pluck(:user_id).include?(user.id) ? true : false
  end


  # Return the like_id given the post and the user
  def like_id(user)
    like = self.likes.where("user_id = ? ", user.id)
    like.first.id
  end

end