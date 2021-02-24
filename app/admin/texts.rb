ActiveAdmin.register Text do
  # ドロップダウンメニューの親成分を決定
  menu parent: "テキスト教材"
  permit_params :genre_id, :title, :contents, :image, :description
  config.sort_order = "position_asc"

  index do
    selectable_column
    column :position
    column :genre
    column :title
    column :description
    actions
  end

  show do
    attributes_table do
      row :position
      row :genre
      row :title
      row :contents
      row :image do
        image_tag(text.image.url) if text.image?
      end
      row :description
    end
  end

  form do |f|
    f.object.position ||= Text.maximum(:position) + 1
    f.semantic_errors
    f.inputs do
      input :position
      input :genre
      input :title, as: :string
      input :contents
      input :image
      input :description
    end
    f.actions
  end
end
