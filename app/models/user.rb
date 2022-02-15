class User < ApplicationRecord
  has_many :stadiums

  after_create :assign_role_to_user
  
  resourcify
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  
  def assign_role_to_user
    if user_type == "1"
      add_role :player
    else
      add_role :owner
    end
  end

  def is?( requested_role )
    self.role == requested_role.to_s
  end

end  
