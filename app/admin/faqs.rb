ActiveAdmin.register Faq do
  permit_params :position, :genre, :question, :answer
  config.sort_order = "position_asc"

  index do
    selectable_column
    column :position
    column :genre, :faq, &:genre_i18n
    column :question
    column :answer
    actions
  end

  show do
    attributes_table do
      row :id
      row :position
      row :genre, :faq, &:genre_i18n
      row :question
      row :answer
    end
  end

  form do |f|
    f.object.position ||= (Faq.maximum(:position) || 0) + 1
    f.semantic_errors
    f.inputs do
      input :position
      input :genre, as: :select, collection: Faq.genres_i18n.invert
      input :question
      input :answer
    end
    f.actions
  end
end
