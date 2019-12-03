class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    
    create_table :questions do |t|
      t.string :question 
      t.string :a
      t.string :b
      t.string :c
      t.string :d
      
    end
  end
end
