ActiveAdmin.register Genre do
  permit_params :position, :title, :color
  config.sort_order = "position_asc"

  index do
    selectable_column
    column :position
    column :title
    column :color
    actions
  end

  show do
    attributes_table do
      row :position
      row :title
      row :color
    end
  end

  form do |f|
    f.object.position ||= Genre.maximum(:position) + 1
    f.semantic_errors
    f.inputs do
      input :position
      input :title
      input :color
    end
    f.actions
  end
end
