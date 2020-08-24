class TaskCollection
    include ActiveModel::Conversion
    extend ActiveModel::Naming
    extend ActiveModel::Translation
    include ActiveModel::AttributeMethods
    include ActiveModel::Validations
    # TASK_NUM = 5  # 同時にユーザーを作成する数
    attr_accessor :collection  # ここに作成したユーザーモデルが格納される
  
    # 初期化メソッド
    def initialize(current_user, task, daily_task)
      if task.present?
        # binding.pry
        # if task[:task].present? && daily_task[:daily_task].present?
        self.collection =Array.new(task.values.count){ Array.new(2)}
        task = task.values
        daily_task = daily_task.values
        daily_task.zip(task).each_with_index do |value, index|
          # binding.pry
          task = Task.find(value[1]['task_id'])
          daily_task = DailyTask.find(value[0]['daily_task_id'])
          # binding.pry
          task.status = value[1]['status']
          daily_task.condition = value[0]['condition']
          daily_task.comment = value[0]['comment']
          self.collection[index][1] = task
          self.collection[index][0] = daily_task
          # binding.pry
        # end
        end
      else
        @daily_tasks = current_user.daily_tasks.where(add_date: Date.today)
        @tasks = @daily_tasks.map do |daily_task|
          daily_task = daily_task.task
        end
        self.collection = @daily_tasks.zip(@tasks)
      end
    end
  
    # レコードが存在するか確認するメソッド
    def persisted?
      false
    end

  def save
    is_success = true
    ActiveRecord::Base.transaction do
      # binding.pry
      collection.each do |result|
        #  binding.pry
        # バリデーションを全てかけたいからsave!ではなくsaveを使用
        is_success = false unless result[0].save
        is_success = false unless result[1].save
      end
      # バリデーションエラーがあった時は例外を発生させてロールバックさせる
      raise ActiveRecord::RecordInvalid unless is_success
    end
    rescue
      p 'エラー'
    ensure
      return is_success
  end
end
