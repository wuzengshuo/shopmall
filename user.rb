class User < ApplicationRecord
  has_many :orders
  has_many :comments
  include BCrypt
  has_secure_password
  attr_accessor :password, :password_confirmation
  validates :email, uniqueness: true

  # def password
  #   @password ||= Password.new(password_hash || "")
  # end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

  def is_admin?
    self.is_admin
  end
end
