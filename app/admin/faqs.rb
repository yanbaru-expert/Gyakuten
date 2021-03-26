ActiveAdmin.register Faq do
  permit_params :position, :question, :answer
  config.sort_order = "position_asc"

  index do
    selectable_column
    column :position
    column :question
    column :answer
    actions
  end

  show do
    attributes_table do
      row :id
      row :position
      row :question
      row :answer
    end
  end

  form do |f|
    f.object.position ||= Faq.maximum(:position) + 1
    f.semantic_errors
    f.inputs do
      input :position
      input :question
      input :answer
    end
    f.actions
  end
end
