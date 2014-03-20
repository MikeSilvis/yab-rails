class UserSerializer < ActiveModel::Serializer
  attributes :id, :phone_number, :name

  def attributes
    super.tap do |hash|
      hash[:authentication_token] = object.authentication_token if object == current_user
    end
  end
end
