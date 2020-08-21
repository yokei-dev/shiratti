class Project < ApplicationRecord
  belongs_to :boss, class_name: 'User', optional: true
  has_many :tasks, dependent: :destroy
  validates :name, presence: true, length: { maximum: 50 }

  has_many :user_projects
  has_many :members, through: :user_projects, source: :user
end
