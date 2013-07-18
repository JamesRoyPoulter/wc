class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :profile_image
  has_secure_password
  has_many :enrolments
  has_many :events, through: :enrolments

  before_save :ensure_user_has_role

  def ensure_user_has_role
    self.role = "user" if self.role==nil
  end

  def role? role
    self.role == role
  end
end
