ActiveAdmin.register Merchant do
  form do |f|
    f.inputs 'Merchant Information' do
      f.input :name
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

  end

  controller do
    def permitted_params
      params.permit!
    end
  end
end
