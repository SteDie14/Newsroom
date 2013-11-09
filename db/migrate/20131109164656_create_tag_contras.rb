class CreateTagContras < ActiveRecord::Migration
  def change
    create_table :tag_contras do |t|
      t.string :name

      t.timestamps
    end
  end
end
