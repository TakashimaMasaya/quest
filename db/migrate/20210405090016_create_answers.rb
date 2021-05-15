class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.bigint :user_id
      t.bigint :question_id

      t.timestamps
    end
  end
end
