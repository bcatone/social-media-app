class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :middle_name, :last_name, :date_of_birth, :city, :state, :country, :zip_code, :gender, :pronouns
end
