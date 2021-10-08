module Types::Input
  class MovieParams < Types::BaseInputObject
    argument :name, String, required: false
  end
end