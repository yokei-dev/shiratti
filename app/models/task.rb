class Task < ApplicationRecord
	belongs_to :user
	belongs_to :project
	has_many :daily_task
end
