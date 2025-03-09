class CreateLearningStyles < ActiveRecord::Migration[5.2]
  def change
    create_table :learning_styles do |t|
      t.string :prompt
      t.string :type1
      t.string :type2
      t.string :type3
      t.string :type4
    end
      
  end
end
