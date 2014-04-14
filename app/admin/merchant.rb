ActiveAdmin.register Merchant do

  filter :name
  filter :aasm_state, as: :select, collection: proc { Merchant::STATES.invert }

  index do
    selectable_column
    id_column
    column :name
    column "Manager", sortable: :user_id do |merchant|
      link_to merchant.user.name, [:admin, merchant.user]
    end
    column "State", sortable: :aasm_state do |merchant|
      status_tag merchant.human_state
    end
    actions
  end

  form do |f|
    f.inputs 'Merchant Information' do
      f.input :name
      f.input :facebook
      f.input :twitter
      f.input :user, as: :select, collection: User.all
      f.input :avatar, as: :file, hint: f.template.image_tag(merchant.thumb_url('200x200#'))
      f.input :aasm_state, as: :select, collection: Merchant::STATES.invert, include_blank: false
    end

    f.inputs 'Location' do
      f.has_many :locations, allow_destroy: true, heading: '' do |cf|
        cf.input :street
        cf.input :city
        cf.input :state
        cf.input :market_id, as: :select, collection: Market.all
        cf.input :zipcode
      end
    end

    f.inputs 'Contact' do
      f.has_many :users, allow_destroy: true, heading: '' do |cf|
        cf.input :email
        cf.input :name
        cf.input :phone_number
      end
    end
    f.actions
  end

  show do
    panel 'Basic Information' do
      attributes_table_for resource, :name
      attributes_table_for resource, :facebook
      attributes_table_for resource, :twitter
      attributes_table_for resource do
        row('Account Manager') { link_to(merchant.user.name, [:admin, merchant.user]) }
        row('Status') { status_tag merchant.human_state }
        row('Logo') { image_tag(merchant.thumb_url('400x400#')) }
      end
    end

    panel 'Contacts' do
      table_for merchant.users.order('name ASC') do
        column 'Name' do |contact|
          link_to contact.name, [:admin, contact]
        end
        column 'Phone Number' do |contact|
          contact.phone_number
        end
        column 'Email' do |contact|
          contact.email
        end
      end
    end

    panel 'Locations' do
      table_for merchant.locations do
        column 'Street' do |location|
          location.street
        end
        column 'State' do |location|
          location.state
        end
        column 'Market' do |location|
          link_to location.market.name, [:admin, location.market] if location.market
        end
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
