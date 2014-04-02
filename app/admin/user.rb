ActiveAdmin.register User do
  permit_params :email

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :market
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :email
      row :name
      row :phone_number
      row :market
    end
    render 'map'
  end

  filter :email
  filter :market

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :name
      f.input :phone_number
      f.input :market
      f.input :admin
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit!
    end
  end

end
