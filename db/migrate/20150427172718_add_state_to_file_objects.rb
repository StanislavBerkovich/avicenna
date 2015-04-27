class AddStateToFileObjects < ActiveRecord::Migration
  def change
    change_table :file_objects do |t|
      t.string :state
    end
  end
end
