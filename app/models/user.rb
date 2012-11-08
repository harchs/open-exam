class User < ActiveRecord::Base
  attr_accessible :email, :name, :organization_id

  belongs_to :organization
  has_many :quizzes
end
