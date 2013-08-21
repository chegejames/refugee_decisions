class CreateTrainingSessions < ActiveRecord::Migration
  def change
    create_table :training_sessions do |t|
      t.references :judge
      t.references :training
      t.date :start_date
      t.date :end_date
      t.string :location

      t.timestamps
    end
    add_index :training_sessions, :judge_id
    add_index :training_sessions, :training_id
  end
end
