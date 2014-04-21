ActiveAdmin.register_page "Dashboard" do
  menu false

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Recent Users" do
          table_for User.order("created_at DESC").limit(10) do
            column "Username" do |user|
              link_to(user.email, admin_user_path(user))
            end
            column("Market") do |user|
              link_to(user.market.name, admin_market_path(user.market)) if user.market
            end
            column("Registered on") do |user|
              user.created_a
            end
          end
        end
      end
    end
  end

end
