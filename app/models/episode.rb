class Episode < ActiveRecord::Base
  belongs_to :series
  validates :name, presence: true, length: { maximum: 50 }
  validates :season, presence: true
  validates :number, presence: true
  validates :series_id, presence: true
  has_many :comments, dependent: :destroy
end
