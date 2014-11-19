ActiveAdmin.register User do

  permit_params :username, :email, :fname, :lname, :password, :location, :restname, :reststreet, :restcity, :reststate, :restzip, :restphone, :latitude, :longitude
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
