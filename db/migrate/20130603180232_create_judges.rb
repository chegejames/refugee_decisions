class CreateJudges < ActiveRecord::Migration
  def change
    create_table :judges do |t|
      t.string :name
      t.integer :membership_id

      t.timestamps
    end
  end
end
