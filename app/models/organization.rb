class Organization < ActiveRecord::Base
  attr_accessible :name, :subdomain

  validates :name, :presence => :true

  has_many :users
  has_many :quizzes
end
