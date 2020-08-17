class ChangeEventsNameNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :events, :name, false
  end
end
