class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable,:validatable
  has_many :posts



  def self.get_all_users
    pluck(:email, :id)
  end
end
