class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum role: { student: 0, teacher: 1, admin: 2 }

  has_many :student_quizzes, foreign_key: 'student_id'
  has_many :quizzes, through: :student_quizzes

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
