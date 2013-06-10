class CreateJudges < ActiveRecord::Migration
  def change
    create_table :judges do |t|
      t.string :name
      t.date :date_of_training
      t.boolean :trained

      t.timestamps
    end
  end
end
