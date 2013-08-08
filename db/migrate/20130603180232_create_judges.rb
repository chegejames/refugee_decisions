class CreateJudges < ActiveRecord::Migration
  def change
    create_table :judges do |t|
      t.integer :membership_id
      t.string :name
      t.string :designation

      t.timestamps
    end
  end
end
