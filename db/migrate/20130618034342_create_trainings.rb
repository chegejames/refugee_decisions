class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.references :judge
      t.date :date
      t.string :remarks

      t.timestamps
    end
  end
end
