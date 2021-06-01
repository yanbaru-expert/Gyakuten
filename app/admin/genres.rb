ActiveAdmin.register Genre do
  permit_params :position, :name, :color
  config.sort_order = "position_asc"

  index do
    selectable_column
    column :position
    column :name
    column :color
    actions
  end

  show do
    attributes_table do
      row :position
      row :code_name
      row :name
      row :color
    end
  end

  form do |f|
    f.object.position ||= Genre.maximum(:position) || 0 + 1
    f.semantic_errors
    f.inputs do
      input :position
      input :name
      input :color
    end
    f.actions
  end
end
