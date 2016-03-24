class Feature < ActiveRecord::Base
  belongs_to :project

  validates :body, presence: true
  validates :project, presence: true
end
