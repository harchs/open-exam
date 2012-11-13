class User < ActiveRecord::Base
  attr_accessible :email, :name, :organization_id, :password, :password_confirmation, :role
  has_secure_password
  belongs_to :organization
  has_many :quizzes

  validates :name, :presence => :true
  validates :email, :presence => :true

end
