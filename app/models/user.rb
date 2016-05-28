class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def name
    firstname + ' ' + lastname
  end
  has_many :posts
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :username, presence: true
  validates :email, format: { :with => VALID_EMAIL_REGEX , message: "email format is not valid" }
  validates :firstname, presence: true
  validates :lastname, presence: true
end
