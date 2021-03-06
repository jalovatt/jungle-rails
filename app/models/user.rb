class User < ActiveRecord::Base
  attr_accessor :remember_token

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 }

  has_many :reviews

  before_save { self.email = email.downcase }

  has_secure_password

  def self.digest(str)
    cost = ActiveModel::SecurePassword.min_cost ?
            BCrypt::Engine::MIN_COST :
            BCrypt::Engine.cost

    BCrypt::Password.create(str, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def self.authenticate_with_credentials(email, password)
    user = User.find_by(email: email.strip.downcase)
    return user if user&.authenticate(password)
  end

end
