ActiveAdmin.register Lecture do
  permit_params :position, :name, :lp_url, :description
  config.sort_order = "position_asc"

  index do
    selectable_column
    column :position
    column :name
    column :description
    actions
  end

  show do
    attributes_table do
      row :position
      row :name
      row :lp_url
      row :description
    end
  end

  form do |f|
    f.object.position ||= (Lecture.maximum(:position) || 0) + 1
    f.semantic_errors
    f.inputs do
      input :position
      input :name
      input :lp_url
      input :description
    end
    f.actions
  end
end
