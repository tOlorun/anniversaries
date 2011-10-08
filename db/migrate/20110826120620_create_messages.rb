class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.string :anniversary_type
      t.string :message_type
      t.text :message
      t.string :status
      t.integer :maker
      t.integer :checker
      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
