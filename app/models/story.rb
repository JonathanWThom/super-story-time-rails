class Story < ActiveRecord::Base
  has_many :contributions
  has_many :users, through: :contributions
  validates :title, :presence => true
end
