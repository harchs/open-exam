class Organization < ActiveRecord::Base
  attr_accessible :name, :subdomain, :invite_code

  validates :name, :presence => :true, :length => { :maximum => 100 }

  has_many :users
  has_many :quizzes

  accepts_nested_attributes_for :users
  validate :validate_unique_users

  def validate_unique_users
    validate_uniqueness_of_in_memory(users, [:email, :organization_id], 'User e-mails must be unique.')
  end
end
