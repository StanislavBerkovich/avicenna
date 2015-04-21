class CreateFiles < ActiveRecord::Migration
  def self.up
    create_table(:file_objects) do |t|
      t.belongs_to :user
      t.attachment :file
      t.timestamps
    end
  end

  def self.down
    drop_table :file_objects
  end
end
