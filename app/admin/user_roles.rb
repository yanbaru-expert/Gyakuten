ActiveAdmin.register UserRole do
  permit_params :user_id, :genre_id, :role

  form do |f|
    f.semantic_errors
    f.inputs do
      input :user, as: :select, collection: User.pluck(:email, :id)
      input :genre
      input :role
    end
    f.actions
  end
end
