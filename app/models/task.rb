class Task < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :project, optional: true
	has_many :daily_task
end
