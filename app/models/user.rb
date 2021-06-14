class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :email, :name

  before_create :default_avatar
  has_and_belongs_to_many :sessions
  has_many :peers



  def default_avatar
    numbr= rand(1..10)
    gen= numbr % 2 == 0 ? "men" : "women" 
    request="https://randomuser.me/api/portraits/med/#{gen}/#{numbr}.jpg"
    self.avatar_url= request
  end
  


end
