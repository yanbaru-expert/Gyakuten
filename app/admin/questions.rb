ActiveAdmin.register Question do
  permit_params :position, :genre_id, :title, :body, :solution
  config.sort_order = "position_asc"

  index do
    selectable_column
    column :position
    column :genre
    column :title
    actions
  end

  show do
    attributes_table do
      row :position
      row :genre
      row :title
      row :body
      row :solution
    end
  end

  form do |f|
    f.object.position ||= Question.maximum(:position) + 1
    f.semantic_errors
    f.inputs do
      input :position
      input :genre
      input :title
      input :body
      input :solution
    end
    f.actions
  end
end
