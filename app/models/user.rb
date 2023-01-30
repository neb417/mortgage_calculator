class User < ApplicationRecord
  include ActiveModel::SecurePassword

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_uniqueness_of :email
  validates_presence_of :password

  has_secure_password
end
