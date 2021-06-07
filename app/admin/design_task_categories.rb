ActiveAdmin.register DesignTaskCategory do
  permit_params :position, :name, :image
  config.sort_order = "position_asc"

  index do
    selectable_column
    column :position
    column :name
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :position
      row :name
      row :image do
        image_tag(design_task_category.image.url) if design_task_category.image?
      end
      row :description
    end
  end
end
