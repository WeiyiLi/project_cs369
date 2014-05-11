class Series < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 50 }
  has_many :reverse_relationships, foreign_key: "Series_id",
                                   class_name:  "Watchlist",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
end
