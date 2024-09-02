class StudentQuiz < ApplicationRecord
  belongs_to :student, class_name: 'User'
  belongs_to :quiz
end
