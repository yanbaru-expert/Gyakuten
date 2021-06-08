ActiveAdmin.register Text do
  # ドロップダウンメニューの親成分を決定
  menu parent: "テキスト教材"
  permit_params :genre_id, :title, :content, :image, :description
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
      row :content
      row :image do
        image_tag(text.image.url) if text.image?
      end
      row :description
    end
  end

  form do |f|
    f.object.position ||= Text.maximum(:position) || 0 + 1
    f.semantic_errors
    f.inputs do
      input :position
      input :genre, as: :select, collection: Genre.order(:position)
      input :title
      input :content
      input :image
      input :description
    end
    f.actions
  end

  csv do
    column :id
    column :position
    column :genre_id
    column(:genre) { |text| text.genre.name }
    column :title
    column :content
    column :description
    column :image
  end
end
