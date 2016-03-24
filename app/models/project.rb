class Project < ActiveRecord::Base
  has_many :features
  has_many :updates

  validates :title, presence: true
  validates :description, presence: true
  validates :github_link, presence: true
end
