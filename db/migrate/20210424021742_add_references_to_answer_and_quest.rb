class AddReferencesToAnswerAndQuest < ActiveRecord::Migration[6.0]
  def change
    add_reference :answers, :user, foreign_key: true
    add_reference :answers, :quest, foreign_key: true
    add_reference :quests, :user, foreign_key: true
  end
end
