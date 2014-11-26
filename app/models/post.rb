class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates_presence_of :title, message: "The title cannot be blank."
  validates_presence_of :body, message: "Your post cannot be blank."

	has_many :relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followeds, through: :relationships
  has_many :reverse_relationships, foreign_key: :followed_id, class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  def to_param
  	"#{id} #{postname}".parameterize
	end

end
