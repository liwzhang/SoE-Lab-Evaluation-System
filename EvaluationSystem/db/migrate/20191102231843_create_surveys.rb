class CreateSurveys < ActiveRecord::Migration[5.2]
  def change
    create_table :surveys do |t|
      t.integer :student_ID
      t.text :student_email
      t.integer :class_num
      t.integer :survey_ID
      t.boolean :status
      t.text :Q1
      t.text :Q2
      t.text :Q3
      t.text :Q4
      t.text :Q5
      t.text :Q6
      t.text :Q7
      t.text :Q8
      t.text :Q9
      t.text :Q10
      t.text :Q11
      t.text :Q12
      t.text :Q13
      t.text :Q14
      t.text :Q15
      t.text :Q16
      t.text :Q17
      t.text :Q18
      t.text :Q19
      t.text :Q20

      t.timestamps
    end
    add_index :surveys, :student_ID, unique: true
  end
end
