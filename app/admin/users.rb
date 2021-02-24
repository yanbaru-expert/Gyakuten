ActiveAdmin.register User do
  permit_params :email, :slack_id, :flag, :password

  controller do
    def update
      if params[:user][:password].blank?
        params[:user].delete(:password)
      else
        params[:user][:password_confirmation] = params[:user][:password]
      end
      super
    end
  end

  index do
    selectable_column
    id_column
    column :flag
    column :slack_name, :user, &:slack_name_i18n
    column :email
    column :current_sign_in_at
    column :created_at
    actions
  end

  filter :flag
  filter :slack_name, as: :select, collection: User.slack_names_i18n.invert
  filter :slack_id
  filter :email
  filter :current_sign_in_at
  filter :created_at

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :flag
      f.input :slack_id
      f.input :slack_name, as: :select, collection: User.slack_names_i18n.invert
      f.input :email
      f.input :password
    end
    f.actions
  end
end
