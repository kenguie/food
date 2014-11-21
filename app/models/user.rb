class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable #, :validatable

  after_create :send_mail
  
  def send_mail
    UserMailer.welcome_email(self).deliver
  end

  before_destroy :send_goodbye

  def send_goodbye
    UserMailer.goodbye_email(self).deliver
  end

  validates_presence_of :restname, message: "Restaurant Name cannot be blank."
  validates_presence_of :reststreet, message: "Restaurant Street Address cannot be blank."
  validates_presence_of :restcity, message: "Restaurant City cannot be blank."
  validates_presence_of :reststate, message: "Restaurant State cannot be blank."

  	has_many :posts, dependent: :destroy
  	has_many :comments, dependent: :destroy

  	has_many :relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  	has_many :followeds, through: :relationships
  	has_many :reverse_relationships, foreign_key: :followed_id, class_name: "Relationship", dependent: :destroy
  	has_many :followers, through: :reverse_relationships, source: :follower

  geocoded_by :address
  after_validation :geocode  

  def address
    [reststreet, restcity, reststate, restzip].compact.join(', ')
  end

  has_attached_file :avatar, :default_url => "missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end
