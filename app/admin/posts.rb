ActiveAdmin.register Post do

  permit_params :title, :published_at,:user_id

  before_update do
    resource.updated_by = current_user.email
  end

  before_create do
    resource.created_by = current_user.email
  end

  filter :title
  filter :user,collection: -> { User.get_all_users }
  filter :published_at
  filter :created_by
  filter :updated_by


  index do
    selectable_column
    id_column
    column :user
    column :title
    column :published_at
    column :updated_by
    column :created_by
    actions
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Post Details" do
      f.input :user,prompt: "Please Select", collection: User.get_all_users
      f.input :title
      f.input :published_at, :as => :datepicker
    end
    f.actions
  end
  
end
