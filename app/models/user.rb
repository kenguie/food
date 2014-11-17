class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable #, :validatable

  validates_presence_of :restname, message: "Restaurant Name cannot be blank."
  validates_presence_of :reststreet, message: "Restaurant Street Address cannot be blank."
  validates_presence_of :restcity, message: "Restaurant City cannot be blank."
  validates_presence_of :reststate, message: "Restaurant State cannot be blank."

  	has_many :posts
  	has_many :comments

  	has_many :relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  	has_many :followeds, through: :relationships
  	has_many :reverse_relationships, foreign_key: :followed_id, class_name: "Relationship", dependent: :destroy
  	has_many :followers, through: :reverse_relationships, source: :follower

end
