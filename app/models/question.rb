class Question < ApplicationRecord
  belongs_to :quiz
  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers, allow_destroy: true

  # Ensure the question type is set to multiple choice
  validates :question_type, inclusion: { in: ['multiple_choice'] }
end
