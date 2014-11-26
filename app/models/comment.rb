class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates_presence_of :title, message: "The title cannot be blank."
  validates_presence_of :body, message: "Your comment cannot be blank."

end


