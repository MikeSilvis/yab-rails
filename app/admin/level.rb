ActiveAdmin.register Level do
  config.sort_order = "points_asc"

  filter :name
  filter :points

  index do
    selectable_column
    id_column
    column :name
    column :points
    column :updated_at
    actions
  end

  form do |f|
    f.inputs 'Level Information' do
      f.input :name
      f.input :points
      f.input :avatar, as: :file, hint: f.template.image_tag(resource.thumb_url('200x200#'))
    end
    f.actions
  end

  show do
    panel 'Basic Information' do
      attributes_table_for resource, :name
      attributes_table_for resource, :points
      attributes_table_for resource do
        row('Avatar') { image_tag(resource.thumb_url('400x400#')) }
      end
    end
    panel 'Discussion' do
      render 'admin/shared/disqus'
    end
  end

  controller do
    def permitted_params
      params.permit!
    end
  end
end
