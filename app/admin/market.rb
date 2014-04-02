ActiveAdmin.register Market do

  form do |f|
    f.inputs "User Details" do
      f.input :name
      f.input :beta
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit!
    end
  end
end
