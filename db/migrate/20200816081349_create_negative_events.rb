class CreateNegativeEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :negative_events do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
