class Comment < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('created_at DESC')}
	validates :content, presence: true, length: {maximum: 350}
	validates :user_id, presence: true
end
