ActiveAdmin.register User do
  
  permit_params :email, :password, :password_confirmation,:role

  index do
    selectable_column
    id_column
    column :email
    column :role
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :role
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  show do
    attributes_table do
      row :email
      row :role
    end
  end

end
