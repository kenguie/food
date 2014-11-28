class AddCountryToUsers < ActiveRecord::Migration
  def change
    add_column :users, :restcountry, :string
  end
end
