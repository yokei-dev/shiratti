class UsersController < ApplicationController

  def doing
    @daily_tasks = current_user.daily_tasks.where(add_date: Date.today.to_s)
  end

end