class CreateStatuses < ActiveRecord::Migration
  def self.up
    create_table :statuses do |t|
      t.string :object_type
      t.string :db_name
      t.string :status
      t.timestamps
    end
  end

  def self.down
    drop_table :statuses
  end
end
