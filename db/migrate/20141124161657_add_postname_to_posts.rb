class AddPostnameToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :postname, :string
  end
end
