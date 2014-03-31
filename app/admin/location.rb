ActiveAdmin.register Location do
  index do
    selectable_column
    id_column
    column :locationable_id
    column :locationable
    column :created_at
    column :latitude
    column :longitude
    actions
  end
end
