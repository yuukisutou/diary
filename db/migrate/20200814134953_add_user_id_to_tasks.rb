class AddUserIdToTasks < ActiveRecord::Migration[5.2]
  def up
    execute 'DELETE FROM events;'
    add_reference :events, :user, null: false, index: true
  end

  def down
    remove_reference :events, :user, index: true
  end
end
