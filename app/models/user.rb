class User < ActiveRecord::Base
  has_many :contributions
  has_many :stories, through: :contributions
  validates :name, :presence => true
  has_secure_password

end
