class Task < ApplicationRecord
	validates :content, presence: true, length: { maximum: 255 }

	belongs_to :user, optional: true
	belongs_to :project, optional: true
	has_many :daily_tasks, dependent: :destroy
end
