module DesignTask
  extend ActiveSupport::Concern

  def set_design_task
    if params[:genre] == "design_task"
      @tasks = DesignTaskList.order(:design_task_category_id, :position).group_by do |task|
        task.design_task_category_id
      end
      @categories = DesignTaskCategory.order(:position)
    end
  end
end
