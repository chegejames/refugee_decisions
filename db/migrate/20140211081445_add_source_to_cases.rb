class AddSourceToCases < ActiveRecord::Migration
  def change
    add_column :cases, :source, :string
  end
end
