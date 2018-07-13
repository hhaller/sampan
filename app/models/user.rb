class User < ApplicationRecord

  # before_save can be written as { self.email = self.email.downcase }
  # inside User model, self is optional on the right-hand side.
  # Also, is valid: before_save { email.downcase! }
  before_save { self.email = email.downcase }
  validates(:name,  presence: true, length: { maximum:  50 })
  validates(:email, presence: true, length: { maximum: 255 })
  validates(:email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i })
  validates(:email, uniqueness: { case_sensitive: false })
  validates(:password, presence: true, length: { minimum: 7 })
  has_secure_password

end
