class Comment < ActiveRecord::Base

	belongs_to :commentable, polymorphic: true
	belongs_to :author, class_name: "User"
	has_many :likes, as: :likable, dependent: :destroy

	validates :author, :author_id, :body, presence: true
end
