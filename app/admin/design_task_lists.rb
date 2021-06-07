ActiveAdmin.register DesignTaskList do
  permit_params :position, :body, :design_task_category_id
  config.sort_order = "position_asc"
end
