class Organization < ActiveRecord::Base
  attr_accessible :name, :subdomain

  has_many :users
  has_many :quizzes
end
