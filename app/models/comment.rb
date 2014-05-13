class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :episode
	default_scope -> { order('created_at DESC')}
	validates :content, presence: true, length: {maximum: 350}
	validates :user_id, presence: true
	validates :episode_id, presence: true
end