class CreateQuests < ActiveRecord::Migration[6.0]
  def change
    create_table :quests do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.bigint :user_id
      t.boolean :solved, default: false, null: false

      t.timestamps
    end
  end
end
