class User < ActiveRecord::Base

  has_secure_password

  validates_presence_of :name, :email, :password
  validates_confirmation_of :password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: true


  before_save do
    self.email = self.email.downcase
  end


  include ActiveModel::SecurePassword::InstanceMethodsOnActivation

end
