ActiveAdmin.register UserRole do
  permit_params :user_id, :genre_id

  form do |f|
    f.semantic_errors
    f.inputs do
      input :user, as: :select, collection: User.pluck(:email, :id)
      input :genre
    end
    f.actions
  end
end
