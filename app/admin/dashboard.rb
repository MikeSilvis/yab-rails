ActiveAdmin.register_page "Dashboard" do
  menu false

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Recent Users" do
          table_for User.order("created_at DESC").limit(10) do
            column("Username")        { |user| link_to(user.email, admin_user_path(user)) }
            column("Registered on")   { |user| user.created_at                       }
          end
        end
      end
    end

  end # content
end
