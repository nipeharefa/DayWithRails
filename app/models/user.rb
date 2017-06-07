class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  # validates :username, presence: true
  validates :email, presence: true

  after_create :update_access_token!  

  def update_access_token!
    self.access_token = "#{self.id}:#{Devise.friendly_token}"
    save
  end


end
