ActiveAdmin.register Movie do
  permit_params :title, :url, :desc, :genre_id, :text_id
  menu parent: "動画教材"
  config.sort_order = "position_asc"

  index do
    selectable_column
    column :position
    column :genre
    column :title
    column :text
    actions
  end

  form do |f|
    f.object.position ||= Movie.maximum(:position) + 1
    f.semantic_errors
    f.inputs do
      input :position
      input :text
      input :genre
      input :title
      input :url
      input :desc
    end
    f.actions
  end
end
