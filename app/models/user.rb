class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validate :password_complexity

  
  validates :name, presence: true, length: { maximum: 50 }
  
  has_many :user_projects
  has_many :joinings, through: :user_projects, source: :project
  
  has_many :daily_tasks
  has_many :tasks
  has_many :daily_users
  
def password_complexity
  # Regexp extracted from https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-a
  return if password.blank? || password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,70}$/

  errors.add :password, 'Complexity requirement not met. Length should be 8-70 characters and include: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
end

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
