ActiveAdmin.register Challenge do
  permit_params :title, :theme, :question, :hint, :image
  config.sort_order = "position_asc"

  index do
    selectable_column
    column :position
    column :theme
    column :title
    actions
  end

  show do
    attributes_table do
      row :position
      row :theme
      row :title
      row :question
      row :hint
      row :image do
        image_tag(challenge.image.url) if challenge.image?
      end
    end
  end

  form do |f|
    f.object.position ||= (Challenge.maximum(:position) || 0) + 1
    f.semantic_errors
    f.inputs do
      input :position
      input :theme
      input :title
      input :question
      input :hint
      input :image
    end
    f.actions
  end
end
