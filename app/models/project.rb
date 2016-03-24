class Project < ActiveRecord::Base
  has_many :features
  
  validates :title, presence: true
  validates :description, presence: true
end
