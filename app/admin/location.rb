ActiveAdmin.register Location do
  index do
    selectable_column
    id_column
    column :locationable
    column :created_at
    column :latitude
    column :longitude
    actions
  end
  controller do
    def permitted_params
      params.permit!
    end
  end
end
