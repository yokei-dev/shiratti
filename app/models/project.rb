class Project < ApplicationRecord
  belongs_to :boss, class_name: 'User', optional: true
  has_many :tasks
  validates :name, presence: true, length: { maximum: 50 }
end
