class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 50 }
  
  has_many :user_projects
  has_many :joinings, through: :user_projects, source: :project

  has_many :daily_tasks
  has_many :tasks, dependent: :destroy
  has_many :daily_users

def join(project)
  self.user_projects.find_or_create_by(project_id: project.id)
end

def unjoin(project)
  project = self.user_projects.find_by(project_id: project.id)
  project.destroy if project
end

def joining?(project)
  self.joinings.include?(project)
end


end
