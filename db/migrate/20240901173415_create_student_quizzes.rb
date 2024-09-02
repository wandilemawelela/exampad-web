class CreateStudentQuizzes < ActiveRecord::Migration[7.0]
  def change
    create_table :student_quizzes do |t|
      t.references :student, foreign_key: { to_table: :users }
      t.references :quiz, null: false, foreign_key: true

      t.timestamps
    end
  end
end
