class Watchlist < ActiveRecord::Base
  belongs_to :follower, class_name: "User"
  belongs_to :series, class_name: "Series"
  validates :follower_id, presence: true
  validates :series_id, presence: true
end
