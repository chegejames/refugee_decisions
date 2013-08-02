class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.string :name
      t.date :date
      t.text :remarks
      t.boolean :publish
      t.attachment :report

      t.timestamps
    end
  end
end
