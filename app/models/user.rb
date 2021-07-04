class User < ApplicationRecord
  has_secure_password(attribute = :password, validations: true)
  validates :email, :password, presence: true

end
