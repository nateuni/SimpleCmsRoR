class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string "name"
      t.string "permalink"
      t.integer "position"
      t.boolean "visible", :default => false
      t.integer "subject_id"
      # foreign key reference
      # t.references :subject
      t.timestamps
    end
    add_index("pages", "subject_id")
    add_index("pages", "permalink")
  end

  def self.down
    drop_table :pages
  end
end
