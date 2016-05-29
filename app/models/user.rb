class User < ActiveRecord::Base
  has_secure_password
  has_many :maps
  has_many :badges

  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  def self.log_in(email, password)
    user = find_by(email: email)
    user && user.authenticate(password)
  end
end
