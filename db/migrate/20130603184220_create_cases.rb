class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.references :judge
      t.references :cause
      t.string :case_number
      t.text :summary_of_decision
      t.date :year_of_judgement
      t.string :court
      t.text :complainant
      t.text :defendant
      t.text :state
      t.text :accused

      t.timestamps
    end
    add_index :cases, :judge_id
    add_index :cases, :cause_id
  end
end
