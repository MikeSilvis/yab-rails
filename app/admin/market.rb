ActiveAdmin.register Market do

  form do |f|
    f.inputs "User Details" do
      f.input :name
      f.input :slug
      f.input :beta, as: :select, include_blank: false, collection: {
        "True" => true,
        "False" => false
      }
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :name
    column :created_at
    actions
  end

  show do
    panel 'Market Details' do
      attributes_table_for resource, :id
      attributes_table_for resource, :name
      attributes_table_for resource, :slug
    end

    panel 'Preferences' do
      table_for resource.preferences.to_a do
        column '' do |preference|
          preference[0].humanize
        end
        column '' do |preference|
          preference[1].humanize
        end
      end
    end

  end

  controller do
    def permitted_params
      params.permit!
    end
  end
end
