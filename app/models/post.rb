class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

	has_many :relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followeds, through: :relationships
  has_many :reverse_relationships, foreign_key: :followed_id, class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower


  def to_param
  	"#{id} #{postname}".parameterize
	end

  # extend FriendlyId
  # 	friendly_id :restname, use: [:slugged, :finders]

end
