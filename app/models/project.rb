class Project < ApplicationRecord
  belongs_to :boss, class_name: 'User', optional: true

  validates :name, presence: true, length: { maximum: 50 }
end