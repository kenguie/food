class AddAddressToUsers < ActiveRecord::Migration
  def change
    add_column :users, :restname, :string
    add_column :users, :reststreet, :string
    add_column :users, :restcity, :string
    add_column :users, :reststate, :string
    add_column :users, :restzip, :string
    add_column :users, :restphone, :string
  end
end
