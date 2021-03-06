class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }
  has_many :comments, dependent: :destroy
  has_many :watchlists, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_series, through: :watchlists, source: :series


  def feed
    Comment.where("user_id = ?", id)
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def following?(series)
    watchlists.find_by(series_id: series.id)
  end

  def follow!(series)
    watchlists.create!(series_id: series.id)
  end

  def unfollow!(series)
    watchlists.find_by(series_id: series.id).destroy
  end

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end
