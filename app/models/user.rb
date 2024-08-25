class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum role: { student: 0, teacher: 1, admin: 2 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
