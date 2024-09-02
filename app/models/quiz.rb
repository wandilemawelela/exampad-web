class Quiz < ApplicationRecord
  has_many :questions, dependent: :destroy

  has_many :student_quizzes
  has_many :students, through: :student_quizzes, source: :student
end
