class RemoveColumnFromQuestAndAnswer < ActiveRecord::Migration[6.0]
  def change
    remove_column :answers, :question_id
    remove_column :answers, :user_id
    remove_column :quests, :user_id
  end
end
