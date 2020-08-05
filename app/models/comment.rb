class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :gossip
	has_many :likes, as: :element_liked
	has_many :bis_comments, class_name: "Comment", foreign_key: "main_comment_id"
	belongs_to :main_comment, class_name: "Comment", optional: true
end
