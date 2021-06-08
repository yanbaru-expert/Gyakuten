ActiveAdmin.register TextImage do
  permit_params :user_id, :image, :title

  index do
    selectable_column
    column :user
    column :title
    actions
  end

  show do
    attributes_table do
      row :user_id
      row :title
      row :image do
        image_tag(text_image.image.url) if text_image.image?
      end
      row :description
    end
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      input :user, as: :select, collection: User.pluck(:email, :id)
      input :image
      input :title
    end
    f.actions
  end
end
