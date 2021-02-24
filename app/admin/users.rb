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
    column :slack_name
    column :email
    column :current_sign_in_at
    column :created_at
    actions
  end

  filter :flag
  filter :slack_name
  filter :slack_id
  filter :email
  filter :current_sign_in_at
  filter :created_at

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :flag
      f.input :email
      f.input :slack_id
      f.input :slack_name
      f.input :password
    end
    f.actions
  end
end
